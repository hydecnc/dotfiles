{ pkgs, pkgsUnstable, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgsUnstable.neovim-unwrapped;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgsUnstable.vimPlugins; [
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
      (pkgsUnstable.vimUtils.buildVimPlugin {
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
      basedpyright
      tinymist

      # linter/formatters
      stylua
      biome
      ruff
    ];
  };
}
