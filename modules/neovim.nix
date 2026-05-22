{ pkgs, unstable, ... }:
{
  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    plugins = with unstable.vimPlugins; [
      kanagawa-nvim
      blink-cmp
      friendly-snippets
      conform-nvim
      nvim-treesitter-textobjects
      (nvim-treesitter.withPlugins (
        p: with p; [
          c
          cpp
          python
          bash
          lua
          nix
          typst
          typescript
        ]
      ))
      nvim-lspconfig
      mini-nvim
      typst-preview-nvim

      # import neovim config as a plugin
      (unstable.vimUtils.buildVimPlugin {
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
      vtsls
      tinymist

      # formatters
      stylua
      biome
    ];
  };
}
