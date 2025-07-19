# The Bullet Physics Playground

A simple physics simulation software for prototyping and experimenting with the
[Bullet Physics](http://bulletphysics.org) library. It provides a graphical user
interface (GUI) for real-time interaction and a command-line interface (CLI) for
batch processing and scripting.

## Features

*   **Physics Simulation:** Powered by the robust and widely-used Bullet
    Physics library.
*   **Cross-Platform:** Builds and runs on Linux, Windows, and macOS.
*   **GUI:** An OpenGL-based GUI for visualizing and interacting with the
    simulations in real-time.
*   **Scripting:** Extend and control simulations using Lua scripting.
*   **Import/Export:**
    *   Import models from [OpenSCAD](http://www.openscad.org/).
    *   Export scenes to [POV-Ray](http://www.povray.org/) for high-quality
        rendering.
*   **Command-Line Interface:** A powerful CLI for running simulations, rendering
    animations, and piping data to other tools like
    [gnuplot](http://www.gnuplot.info/).

## Videos on YouTube

<a href="https://www.youtube.com/watch?v=RwMhyvVPsQI&list=PL-OhsevLGGI2bFpOqzqnWsGILh9a5YkDr" target="_blank"><img src="http://img.youtube.com/vi/RwMhyvVPsQI/maxresdefault.jpg" alt="Bullet Physics Playground" width="640" border="10" /></a>

## Build

Select your operating system:

 * [Build on Linux](https://github.com/bullet-physics-playground/bpp/wiki/Build-on-Linux)
 * [Build on Windows](https://github.com/bullet-physics-playground/bpp/wiki/Build-on-Windows)
 * [Build on Mac OS-X](https://github.com/bullet-physics-playground/bpp/wiki/Build-on-Mac-OS-X)

## Usage

### GUI

*   **S:** Start/stop the physics simulation.
*   **P:** Toggle POV-Ray export mode.
*   **G:** Toggle PNG screenshot saving mode.
*   **A:** Toggle display of the world axis.
*   **F:** Toggle FPS display.
*   **Enter:** Start/stop the animation.
*   **Space:** Toggle between fly and revolve camera modes.
*   **Arrow Keys:** Move the camera.
*   **H:** Show the QGLViewer help window.

### Command-Line

The command-line interface allows you to run simulations without the GUI. For
example, you can pipe the simulation data to `gnuplot` to visualize the results:

```bash
bpp -n 200 -f demo/basic/00-hello-cmdline.lua | \
    gnuplot -e "set terminal dumb; plot for[col=3:3] '/dev/stdin' \
    using 1:col title columnheader(col) with lines"
```

### Scripting

The Bullet Physics Playground can be scripted with Lua. You can find several
example scripts in the `demo` directory. To see a list of Lua-accessible
classes, functions, and properties, run:

```bash
bpp -f demo/basic/02-luabind.lua
```

## Documentation

The project uses [Doxygen](http://www.doxygen.nl/) to generate documentation from
the source code comments. To generate the documentation, run:

```bash
doxygen Doxyfile
```

The generated HTML documentation will be in the `html` directory.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an
issue on the [GitHub repository](https://github.com/bullet-physics-playground/bpp).

## License

The Bullet Physics Playground is licensed under the
[GNU Lesser General Public License](LICENSE).

## Acknowledgments

*   **Jakob Flierl** – [koppi](https://github.com/koppi) – Initial release.
*   **Jaime Vives Piqueres** – [jaimevives](https://github.com/jaimevives) –
    POV-Ray export and his
    [latest computer generated images](http://www.ignorancia.org/index.php?page=latest-images).
