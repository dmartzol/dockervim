{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "my-tools";
  paths = [
    pkgs.curl
    pkgs.fd
    pkgs.fzf
    pkgs.fish
    pkgs.starship
    pkgs.neovim
    pkgs.ninja
    pkgs.go_1_18
    pkgs.gopls
    pkgs.golangci-lint
    pkgs.gettext
    pkgs.libtool
    pkgs.autoconf
    pkgs.automake
    pkgs.cmake
    pkgs.gcc
    pkgs.pkg-config
    pkgs.unzip
    pkgs.doxygen
    pkgs.ripgrep
    pkgs.python3
    pkgs.nodejs
    pkgs.zsh
    pkgs.stow
    pkgs.sumneko-lua-language-server
  ];
}
