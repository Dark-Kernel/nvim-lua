function colormyvim(color)
	color = color 
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

colormyvim()
--=======
----function colormyvim(color)
----	color = color 
----	vim.cmd.colorscheme(color)
----
----	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
----	
----end
----
----colormyvim()
-->>>>>>> 138b446f190a1b37642d9b29cbd4c62e85d051f8
