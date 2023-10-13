# pico-dev

Dev pi pico environment in C for vscode

# Usage

- Clone or [download zip](https://github.com/xackery/pico-dev/archive/refs/heads/main.zip) of this repo.
- Edit Makefile top line `NAME := pico-dev` renaming it to your project's name.
- Bottom left corner of vscode, reopen in dev container.
- One time run `make deps-clone` to download deps folder.
- One time Run `make deps-install` to install dependencies in container (this will take a while).
- Now, from now run `make build`, it will create a build subfolder, and prepare cmake for environment. Repeat for rebuilding.
- Your binaries will be copied to bin/, explore it for various files to copy to your pico!
