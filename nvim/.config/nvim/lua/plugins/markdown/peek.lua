return {
  "toppair/peek.nvim",
  ft = "markdown",
  build = "deno task --quiet build:fast",
  opts = {
    filetype = { "markdown" },
    app = "browser",
  },
}
