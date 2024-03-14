return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").sourcekit.setup {
        cmd = {
          "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
        },
      }
    end,
  },
}
