require'nvim-treesitter.configs'.setup{
  ensure_installed = { 
    "html", 
    "javascript", 
    "typescript", 
    "tsx", 
  },
  indent = {
    enable = true
  },
	highlight = {
		enable = true
	},
  matchup = {
    enable = true
  }
}
