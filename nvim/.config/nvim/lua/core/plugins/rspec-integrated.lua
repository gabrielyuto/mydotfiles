return {
  "melopilosyan/rspec-integrated.nvim",
  ft = { "ruby", "spec" },
  dependencies = {
      "rcarriga/nvim-notify" -- Garante que nvim-notify seja carregado primeiro/junto
  },
  config = function()
    require("rspec").setup({
    })
  end,
}
