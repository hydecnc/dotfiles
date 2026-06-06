{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
    plugins = with pkgs.vimPlugins; [
      kanagawa-nvim
      blink-cmp
      friendly-snippets
      conform-nvim
      nvim-treesitter-textobjects
      (nvim-treesitter.withPlugins (
        p: with p; [
          bash
          c
          cpp
          go
          lua
          nix
          python
          typescript
          typst
        ]
      ))
      nvim-lspconfig
      mini-nvim
      typst-preview-nvim

      # import neovim config as a plugin
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-config";
        src = ./nvim;
        doCheck = false;
      })
    ];
    extraPackages = with pkgs; [
      # LSP
      basedpyright
      clang-tools
      gopls
      lua-language-server
      nixfmt
      tinymist
      vtsls

      # linter/formatters
      biome
      ruff
      stylua
    ];
  };
}
