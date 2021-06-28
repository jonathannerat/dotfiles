augroup reload_configs
	au!
	au BufWritePost ~/.config/nvim/vim/*.vim ++nested source %
	au BufWritePost ~/.local/src/dotfiles/.config/nvim/vim/*.vim ++nested source %
augroup END

augroup firevim_rules
	au!
	au BufEnter www.overleaf.com_project-* set textwidth=80 spell
augroup END
