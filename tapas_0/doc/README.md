# cpp_gfx_tapas

I git repo with small exploration cpp-projects to try different Ux:es, CAD graphics and rendering.

## Helper Scripts

- **[init_tool_chain.zsh](../init_tool_chain.zsh)** - Initializes toolchain and generates CMake presets
- **[run.zsh](../run.zsh)** - Builds and runs the application
- **[go_repl.zsh](../go_repl.zsh)** - Activates python virtual environment and kicks off 'rinse_and_repeat.py'
  (Creates a REPL-like C++ development environment)
- **[rinse_and_repeat.py](../rinse_and_repeat.py)** - Repeatadly Executes command in 'command_to_repeat.txt' on any change to src folder

# Initial version 0.0

An empty repository to create a C++ CMake and Conan package manager consuming software development environment.

This project is setup as a conan package consumer combined with cmake support for tool chain build and application.

For conan command references see https://docs.conan.io/2/reference/commands.html

##  conan new cmake_exe -d name=tapas_0 -d version=0.0

```sh
File saved: CMakeLists.txt
File saved: conanfile.py
File saved: src/main.cpp
File saved: src/tapas_0.cpp
File saved: src/tapas_0.h
File saved: test_package/conanfile.py
```
