{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      kanagawa-nvim
      blink-cmp
      friendly-snippets
      conform-nvim
      (nvim-treesitter.withPlugins (
        p: with p; [
          c
          cpp
          python
          bash
          lua
          nix
          typst
        ]
      ))
      nvim-lspconfig
      mini-nvim

      # import neovim config as a plugin
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-config";
        src = ./nvim;
        doCheck = false;
      })
    ];
    extraPackages = with pkgs; [
      # LSP
      lua-language-server
      clang-tools
      nixfmt

      # formatters
      stylua
    ];
  };
}
