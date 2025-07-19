--
-- Print all registered classes
--

info = function(c)
  --printf("Type %s", type(c))

  printf("   * properties:")
  for k, f in pairs(class_info(c).attributes) do
    printf("    * %s %s", f, class_info(c[f]).name)
  end

  printf("   * functions:")
  for k, f in pairs(class_info(c).methods) do
    printf("    * %s", k)
  end
end

classes = function()
  printf("Registered classes:")
  for i, f in ipairs(class_names()) do
    printf("  * %s", f)
  end
end

--- lists all available classes
--classes()

--- print attributes of class v
--info(v)

local seen={}

function dump(t,i)
  seen[t]=true
  local s={}
  local n=0
  for k in pairs(t) do
    n=n+1 s[n]=k
  end
  table.sort(s)
  for k,v in ipairs(s) do
    printf("%s %s", i,v)
    v=t[v]
    if type(v)=="table" and not seen[v] then
      info(v)
      dump(v,i.."  ")
    end
  end
end

dump(_G,"")
