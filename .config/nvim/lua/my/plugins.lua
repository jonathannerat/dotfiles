local M = {}

local packages = {
	-- colorschemes
	themes = {
		{ 'embark-theme/vim', as = 'embark-theme'},
		{ 'folke/tokyonight.nvim' },
		'sainnhe/gruvbox-material'
	},
	-- external tools integration
	integration = {
		'tpope/vim-fugitive',
		'kdheepak/lazygit.nvim',
		'lervag/vimtex',
		'asciidoc/vim-asciidoc',
		'mcchrish/nnn.vim',
		{
			'iamcco/markdown-preview.nvim',
			run = 'cd app && yarn install',
			ft = { 'markdown', 'pandoc.markdown', 'rmd' }
		},
		'vim-pandoc/vim-pandoc',
		{ 'glacambre/firenvim', run = ':call firenvim#install(0)' }
	},
	enhanced_vim = {
		'tpope/vim-obsession',
		'editorconfig/editorconfig-vim',
		{
			'neovim/nvim-lspconfig',
			requires = 'ray-x/lsp_signature.nvim',
			config = function()
				local lspconfig = require'lspconfig'
				local m = require'my.util.mapper'
				local on_attach = function(client, bufnr)
					local mappings = {
						['n|ns|gD']         = m.cmd('lua vim.lsp.buf.declaration()'),
						['n|ns|gd']         = m.cmd('lua vim.lsp.buf.definition()'),
						['n|ns|K']          = m.cmd('lua vim.lsp.buf.hover()'),
						['n|ns|gi']         = m.cmd('lua vim.lsp.buf.implementation()'),
						['n|ns|<C-k>']      = m.cmd('lua vim.lsp.buf.signature_help()'),
						['n|ns|<leader>wa'] = m.cmd('lua vim.lsp.buf.add_workspace_folder()'),
						['n|ns|<leader>wr'] = m.cmd('lua vim.lsp.buf.remove_workspace_folder()'),
						['n|ns|<leader>wl'] = m.cmd('lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'),
						['n|ns|<leader>D']  = m.cmd('lua vim.lsp.buf.type_definition()'),
						['n|ns|<leader>rn'] = m.cmd('lua vim.lsp.buf.rename()'),
						['n|ns|<leader>ca'] = m.cmd('lua vim.lsp.buf.code_action()'),
						['n|ns|gr']         = m.cmd('lua vim.lsp.buf.references()'),
						['n|ns|<leader>e']  = m.cmd('lua vim.lsp.diagnostic.show_line_diagnostics()'),
						['n|ns|[d']         = m.cmd('lua vim.lsp.diagnostic.goto_prev()'),
						['n|ns|]d' ]        = m.cmd('lua vim.lsp.diagnostic.goto_next()'),
						['n|ns|<leader>dd'] = m.cmd('lua vim.lsp.diagnostic.set_loclist()'),
					}

					if client.resolved_capabilities.document_formatting then
						mappings['n|ns|<leader>f'] = m.cmd('lua vim.lsp.buf.formatting()')
					end

					if client.resolved_capabilities.document_range_formatting then
						mappings['v|ns|<leader>f'] = m.cmd('lua vim.lsp.buf.range_formatting()')
					end

					m.bind(mappings, bufnr)

					require'lsp_signature'.on_attach({
						bind = true,
						doc_lines = 2,
						hint_enable = true,
						hint_prefix = "»",
						handler_opts = {
							border = 'single',
						}
					})
				end

				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				capabilities.textDocument.completion.completionItem.resolveSupport = {
					properties = {
						'documentation',
						'detail',
						'additionalTextEdits',
					}
				}


				local servers = {
					tsserver = {},
					cssls = {},
					vimls = {},
					ccls = {},
					bashls = {},
					pyls = {},
					rust_analyzer = {},
					solargraph = {},
					sumneko_lua = require'my.lua_lsp',
					jsonls = {
						cmd = { 'json-languageserver', '--stdio' }
					},
					texlab = {},
				}

				servers.sumneko_lua.cmd = {
					'/home/jonathan/.local/src/lua-language-server/bin/Linux/lua-language-server',
					'-E',
					'/home/jonathan/.local/src/lua-language-server/main.lua'
				}

				for lsp, config in pairs(servers) do
					if not config.on_attach    then config.on_attach    = on_attach end
					if not config.capabilities then config.capabilities = capabilities end

					lspconfig[lsp].setup(config)
				end
			end},
		{
			'hrsh7th/nvim-compe',
			config = function()
				require'compe'.setup {
					enabled = true,
					autocomplete = true,
					documentation = true,
					source = {
						path = true,
						buffer = true,
						calc = true,
						nvim_lsp = true,
						luasnip = true,
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
					},
					indent = {
						enable = true,
					}
				}
			end
		},
		{
			'nvim-treesitter/playground',
			run = ':TSUpdate query'
		},
		{
			'hoob3rt/lualine.nvim',
			requires = { {'ryanoasis/vim-devicons', opt = true}, {'tpope/vim-fugitive', opt = true} },
			config = function()
				require'lualine'.setup {
					sections = {
						lualine_a = {'mode'},
						lualine_b = {'branch', 'diff'},
						lualine_c = {'filename'},
						lualine_x = {'encoding', 'fileformat', 'filetype'},
						lualine_y = {'progress'},
						lualine_z = {'location'},
					},
					inactive_sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = {'filename'},
						lualine_x = {'location'},
						lualine_y = {},
						lualine_z = {},
					},
					options = {
						theme = 'gruvbox_material',
					},
					extensions = { 'fzf', 'fugitive' }
				}
			end
		},
		{
			'folke/trouble.nvim',
			config = function()
				require'trouble'.setup{
					icons = false
				}
			end
		}
	},
	editing = {
		'tpope/vim-commentary',
		'tpope/vim-surround',
		{
			'cohama/lexima.vim',
			config = [=[
vim.call("lexima#add_rule", {char='$', input_after='$', filetype='tex'})
vim.call("lexima#add_rule", {char='$', at=[[\%#\$]], leave=1, filetype='tex'})
vim.call("lexima#add_rule", {char='<BS>', at=[[\$\%#\$]], delete=1, filetype='tex'})
			]=]
		},
		{
			'nvim-telescope/telescope.nvim',
			requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
			config = function()
				local telescope = require'telescope'
				telescope.setup{
					defaults = {
						file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
						grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
					},
					extensions = {
						fzf = {
							override_generic_sorter = false,
							override_file_sorter = true,
							case_mode = 'smart_case',
						}
					}
				}
				telescope.load_extension('fzf')
			end
		},
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
		},
		'L3MON4D3/LuaSnip',
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
}

function M.setup()
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
			virtual_text = true,
		}
	)
end

return M
