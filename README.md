# neovim setup

## manual config
`VimPlug` must be installed doing anything in here: https://github.com/junegunn/vim-plug

## Language servers
Install the language servers by themselves. Here's the relevant LSP's:

### Typescript / Javascript
`yarn global add typescript-language-server`

### Go
Install `gopls`. You probably need Go installed on your system first.

### C++
You need clang and llvm (for clangd) installed to use this. Also, this works in 
conjuction CMAKE to provide data for the LSP. It references `compile_commands.json` file
to make the whole thing work. CMAKE will generate one if you put the following
**directly** (this is important) after your project name:

`set(CMAKE_EXPORT_COMPILE_COMMANDS ON)`

### HTML/CSS
`yarn global add vscode-langservers-extracted`

### PHP
Add `phpactor`. Relevant docs: https://phpactor.readthedocs.io/en/master/usage/language-server.html

### Treesitter
Treesitter makes the syntax highlighting work better. Most installs are a single command.

`TSInstall` the following:
- typescript
- php
- go
- cpp (C++)
- html
- css


