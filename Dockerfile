# NixOS image as base
FROM nixos/nix:2.11.0 as base
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV LANGUAGE en_US:en
ENV TZ=America/Chicago
RUN nix-channel --update
RUN nix-build -A pythonFull '<nixpkgs>'

FROM base as packages
COPY default.nix .
# Copy configuration files
COPY .config /root/.config
RUN nix-env -i -f default.nix

FROM packages as neovim
# install Packer plugin manager
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

WORKDIR /code
