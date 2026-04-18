local M = {}

local function tridiag_solve(a, b, c, d)
  local n = #d
  local cprime = {}
  local dprime = {}
  local x = {}

  cprime[1] = c[1] / b[1]
  dprime[1] = d[1] / b[1]

  for i = 2, n do
    local m = a[i - 1] / (b[i - 1] - a[i - 1] * cprime[i - 1])
    cprime[i] = c[i] / (b[i] - a[i] * cprime[i - 1])
    dprime[i] = (d[i] - a[i] * dprime[i - 1]) / (b[i] - a[i] * cprime[i - 1])
  end

  x[n] = dprime[n]
  for i = n - 1, 1, -1 do
    x[i] = dprime[i] - cprime[i] * x[i + 1]
  end

  return x
end

local function compute_natural_cubic_1d(values)
  local n = #values - 1
  if n < 1 then return {} end
  if n == 1 then
    local a0 = values[1]
    local a1 = values[2] - values[1]
    return { { a0, a1, 0, 0 } }
  end

  local h = {}
  for i = 1, n do
    h[i] = 1
  end

  local alpha = {}
  alpha[1] = 0
  for i = 2, n do
    alpha[i] = 3 * (values[i + 1] - values[i]) / h[i]
      - 3 * (values[i] - values[i - 1]) / h[i - 1]
  end

  local l = {}
  local mu = {}
  local z = {}
  l[1] = 1
  mu[1] = 0
  z[1] = 0

  for i = 2, n do
    l[i] = 2 * (h[i - 1] + h[i]) - h[i - 1] * mu[i - 1]
    mu[i] = h[i] / l[i]
    z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i]
  end

  local ccoeff = {}
  local bcoeff = {}
  local dcoeff = {}

  ccoeff[n] = 0
  for j = n - 1, 1, -1 do
    ccoeff[j] = z[j] - mu[j] * ccoeff[j + 1]
    bcoeff[j] = (values[j + 1] - values[j]) / h[j]
      - h[j] * (ccoeff[j + 1] + 2 * ccoeff[j]) / 3
    dcoeff[j] = (ccoeff[j + 1] - ccoeff[j]) / (3 * h[j])
  end

  local segments = {}
  for i = 1, n do
    segments[i] = {
      values[i],
      bcoeff[i],
      ccoeff[i],
      dcoeff[i],
    }
  end

  return segments
end

local function eval_cubic_1d(segments, t)
  local n = #segments
  if n == 0 then return 0 end
  local i = math.floor(t)
  if i < 1 then i = 1 end
  if i > n then i = n end
  local dt = t - i
  local s = segments[i]
  return s[1] + s[2] * dt + s[3] * dt * dt + s[4] * dt * dt * dt
end

function M.CubicSpline(points)
  local spline = {}

  local xs = {}
  local ys = {}
  local zs = {}
  for i, p in ipairs(points) do
    xs[i] = p.x
    ys[i] = p.y
    zs[i] = p.z
  end

  spline.segments_x = compute_natural_cubic_1d(xs)
  spline.segments_y = compute_natural_cubic_1d(ys)
  spline.segments_z = compute_natural_cubic_1d(zs)
  spline.num_points = #points
  spline.num_segments = #points - 1

  function spline:eval(t)
    local tt = math.max(1, math.min(t, self.num_segments))
    local x = eval_cubic_1d(self.segments_x, tt)
    local y = eval_cubic_1d(self.segments_y, tt)
    local z = eval_cubic_1d(self.segments_z, tt)
    return { x = x, y = y, z = z }
  end

  function spline:eval_range(t_start, t_end, steps)
    local result = {}
    for i = 0, steps do
      local t = t_start + (t_end - t_start) * i / steps
      table.insert(result, self:eval(t))
    end
    return result
  end

  return spline
end

function M.CatmullRom(points, alpha)
  alpha = alpha or 0.5

  local extended = {}
  table.insert(extended, points[1])
  for _, p in ipairs(points) do
    table.insert(extended, p)
  end
  table.insert(extended, points[#points])

  local function catmull_rom_point(p0, p1, p2, p3, t, a)
    local tt = t * t
    local ttt = tt * t

    local q1 = -a * ttt + 2 * a * tt - a * t
    local q2 = (2 - a) * ttt + (a - 3) * tt + 1
    local q3 = (a - 2) * ttt + (3 - 2 * a) * tt + a * t
    local q4 = a * ttt - a * tt

    local x = q1 * p0.x + q2 * p1.x + q3 * p2.x + q4 * p3.x
    local y = q1 * p0.y + q2 * p1.y + q3 * p2.y + q4 * p3.y
    local z = q1 * p0.z + q2 * p1.z + q3 * p2.z + q4 * p3.z

    return { x = x, y = y, z = z }
  end

  local spline = {}
  spline.points = extended
  spline.alpha = alpha
  spline.num_segments = #extended - 3

  function spline:eval(t)
    local n = #self.points - 3
    if n < 1 then
      local p = self.points[2]
      return { x = p.x, y = p.y, z = p.z }
    end

    local tt = math.max(0, math.min(t, n))
    local i = math.floor(tt)
    if i < 1 then i = 1 end
    if i > n then i = n end
    local frac = tt - i

    return catmull_rom_point(
      self.points[i],
      self.points[i + 1],
      self.points[i + 2],
      self.points[i + 3],
      frac,
      self.alpha
    )
  end

  function spline:eval_range(t_start, t_end, steps)
    local result = {}
    for i = 0, steps do
      local t = t_start + (t_end - t_start) * i / steps
      table.insert(result, self:eval(t))
    end
    return result
  end

  return spline
end

function M.LinearInterp(points)
  local interp = {}

  interp.points = points

  function interp:eval(t)
    local n = #points
    if n == 0 then return { x = 0, y = 0, z = 0 } end
    if n == 1 then return { x = points[1].x, y = points[1].y, z = points[1].z } end

    local tt = math.max(1, math.min(t, n - 1))
    local i = math.floor(tt)
    if i < 1 then i = 1 end
    if i >= n then i = n - 1 end
    local frac = tt - i

    local p1 = points[i]
    local p2 = points[i + 1]
    return {
      x = p1.x + (p2.x - p1.x) * frac,
      y = p1.y + (p2.y - p1.y) * frac,
      z = p1.z + (p2.z - p1.z) * frac,
    }
  end

  function interp:eval_range(t_start, t_end, steps)
    local result = {}
    for i = 0, steps do
      local t = t_start + (t_end - t_start) * i / steps
      table.insert(result, self:eval(t))
    end
    return result
  end

  return interp
end

return M