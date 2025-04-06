# Love2D Template for VSCode

This repository is a template for creating Love2D projects with Visual Studio Code. It includes a pre-configured development environment, debugging setup, and build tools to streamline your workflow.

## Features

- **Pre-configured Visual Studio Code settings**:

  - Lua language server support via [sumneko.lua](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).
  - Debugging support with [local-lua-debugger-vscode](https://marketplace.visualstudio.com/items?itemName=tomblind.local-lua-debugger-vscode).
  - Linting with [luacheck](https://marketplace.visualstudio.com/items?itemName=rog2.luacheck).

- **Debugging support**:

  - Automatically enables the debugger when running in debug mode.

- **Build tools**:

  - A PowerShell script to package your Love2D project into a `.love` file and a Windows executable.

- **Example project**:

  - A simple "Hello World" Love2D project

- **Included libraries**:

  Libraries included in the `src/lib/` directory, under the terms of their MIT license

  - [rxi/lume](https://github.com/rxi/lume)
  - [rxi/json.lua](https://github.com/rxi/json.lua)

## Getting Started

### Prerequisites

1. Install [Love2D](https://love2d.org/).
   1. Make sure that love.exe is in your Windows PATH.
2. Install Visual Studio Code and the recommended extensions:

   - [sumneko.lua](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
   - [local-lua-debugger-vscode](https://marketplace.visualstudio.com/items?itemName=tomblind.local-lua-debugger-vscode)
   - [luacheck](https://marketplace.visualstudio.com/items?itemName=rog2.luacheck)

### Running the Project

1. Open this repository in Visual Studio Code.
2. Press `F5` to start debugging or run the project in release mode using the configurations in `.vscode/launch.json`.

### Building for Windows

This will build a standalone exe from the code in `src/` the resulting executable will be `dist/out.exe`

1. Open a PowerShell terminal.
2. Run the `tools/build-win.ps1` script:
   ```ps1
   .\tools\build-win.ps1 .\src .\dist
   ```

Or from VS Code pick 'Terminal > Run Build Task'
