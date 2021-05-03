local global = require'my.global'
local vim = vim

vim.cmd 'packadd packer.nvim'

local packages = {
	-- colorschemes
	themes = {
		{ 'embark-theme/vim', as = 'embark-theme'},
		{ 'folke/tokyonight.nvim' },
		'marko-cerovac/material.nvim'
	},
	-- external tools integration
	integration = {
		'tpope/vim-fugitive',
		'lervag/vimtex',
		'asciidoc/vim-asciidoc',
		'mcchrish/nnn.vim',
		{
			'iamcco/markdown-preview.nvim',
			run = 'cd app && yarn install',
			ft = { 'markdown', 'pandoc.markdown', 'rmd' }
		},
		'vim-pandoc/vim-pandoc',
		{ 'raghur/vim-ghost', run = ':GhostInstall' }
	},
	enhanced_vim = {
		'tpope/vim-obsession',
		'editorconfig/editorconfig-vim',
		{
			'neovim/nvim-lspconfig',
			config = function() 
				local lspconfig = require'lspconfig'
				local bind = require'my.keymap.bind'
				local map_cr = bind.map_cr
				local on_attach = function(client, _)
					local mappings = {
						['n|gD'] = map_cr('lua vim.lsp.buf.declaration()'):with_silent():with_noremap(),
						['n|gd'] = map_cr('lua vim.lsp.buf.definition()'):with_silent():with_noremap(),
						['n|K'] = map_cr('lua vim.lsp.buf.hover()'):with_silent():with_noremap(),
						['n|gi'] = map_cr('lua vim.lsp.buf.implementation()'):with_silent():with_noremap(),
						['n|<C-k>'] = map_cr('lua vim.lsp.buf.signature_help()'):with_silent():with_noremap(),
						['n|<space>wa'] = map_cr('lua vim.lsp.buf.add_workspace_folder()'):with_silent():with_noremap(),
						['n|<space>wr'] = map_cr('lua vim.lsp.buf.remove_workspace_folder()'):with_silent():with_noremap(),
						['n|<space>wl'] = map_cr('lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'):with_silent():with_noremap(),
						['n|<space>D'] = map_cr('lua vim.lsp.buf.type_definition()'):with_silent():with_noremap(),
						['n|<space>rn'] = map_cr('lua vim.lsp.buf.rename()'):with_silent():with_noremap(),
						['n|gr'] = map_cr('lua vim.lsp.buf.references()'):with_silent():with_noremap(),
						['n|<space>e'] = map_cr('lua vim.lsp.diagnostic.show_line_diagnostics()'):with_silent():with_noremap(),
						['n|[d'] = map_cr('lua vim.lsp.diagnostic.goto_prev()'):with_silent():with_noremap(),
						['n|]d' ] = map_cr('lua vim.lsp.diagnostic.goto_next()'):with_silent():with_noremap(),
						['n|<leader>dd'] = map_cr('lua vim.lsp.diagnostic.set_loclist()'):with_silent():with_noremap(),
					}

					if client.resolved_capabilities.document_formatting then
						mappings['n|<space>f'] = map_cr('lua vim.lsp.buf.formatting()'):with_silent():with_noremap()
					end

					if client.resolved_capabilities.document_range_formatting then
						mappings['v|<space>f'] = map_cr('lua vim.lsp.buf.range_formatting()'):with_silent():with_noremap()
					end

					bind.nvim_load_mapping(mappings)
				end

				local servers = {
					tsserver = {},
					cssls = {},
					vimls = {},
					ccls = {},
					bashls = {},
					pyls = {},
					rust_analyzer = {},
					solargraph = {},
					sumneko_lua = {
						cmd = {
							"/home/jonathan/.local/src/lua-language-server/bin/Linux/lua-language-server",
							"-E",
							"/home/jonathan/.local/src/lua-language-server/main.lua"
						}
					},
					jsonls = {
						cmd = { 'json-languageserver', '--stdio' }
					},
					efm = {
						cmd = {
							"efm-langserver",
							"-c",
							"/home/jonathan/.config/efm-langserver/config.yaml",
						},
						init_options = { documentFormatting = true },
					},
					texlab = {},
				}

				for lsp, config in pairs(servers) do
					if not config.on_attach then config.on_attach = on_attach end
					lspconfig[lsp].setup(config)
				end
			end},
		{
			'hrsh7th/nvim-compe',
			config = function()
				require'compe'.setup {
					enabled = true,
					autocomplete = true,
					source = {
						path = true,
						buffer = true,
						calc = true,
						nvim_lsp = true,
						nvim_lua = true,
						ultisnips = true,
					}
				}
			end
		},
		'mhinz/vim-startify',
		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function()
				require'nvim-treesitter.configs'.setup {
					ensure_installed = "maintained",
					-- Modules
					highlight = {
						enable = true,
					},
					incremental_selection = {
						enable = true,
					}
				}
			end}, 
		{
			'hoob3rt/lualine.nvim',
			requires = { {'ryanoasis/vim-devicons', opt = true}, {'tpope/vim-fugitive', opt = true} },
			config = function()
				local defaults = require'lualine.defaults'
				require'lualine'.setup {
					sections = defaults.sections,
					inactive_sections = defaults.inactive_sections,
					options = {
						theme = 'tokyonight',
						icons_enabled = true,
					},
					extensions = { 'fzf', 'fugitive' }
				}
			end
		}
	},
	editing = {
		'tpope/vim-commentary',
		'tpope/vim-surround',
		'cohama/lexima.vim',
		{
			'nvim-telescope/telescope.nvim',
			requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
			config = function()
				require'telescope'.setup{
					defaults = {
						file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
						grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
					}
				}
			end
		},
		'SirVer/ultisnips',
		'lambdalisue/suda.vim',
		{
			'norcalli/nvim-colorizer.lua',
			config = function()
				require'colorizer'.setup(nil, { css=true })
			end
		},
	},
	syntax = {
		{
			'neomutt/neomutt.vim',
			ft = { 'mutt', 'neomutt' }
		},
		{
			'cakebaker/scss-syntax.vim',
			ft = { 'scss' }
		},
		{
			'gkz/vim-ls',
			as = 'livescript-syntax',
			ft = { 'ls' }
		},
		{
			'tbastos/vim-lua',
			ft = { 'lua' }
		},
		{
			'leafo/moonscript-vim',
			ft = { 'moon' }
		},
		{
			'cespare/vim-toml',
			ft = { 'toml' }
		},
		{
			'vim-pandoc/vim-pandoc-syntax',
			ft = { 'pandoc' }
		},
		{
			'arrufat/vala.vim',
			ft = { 'vala' }
		}
	},
	other = {
		'~/proj/nlua.nvim'
	}
}

require'packer'.startup(function(use)
	use { 'wbthomason/packer.nvim', opt = true }
	for _, category in pairs(packages) do
		for _, package in pairs(category) do
			use(package)
		end
	end
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		virtual_text = false,
	}
)

vim.g.tokyonight_style = 'night'
vim.cmd 'colorscheme tokyonight'
