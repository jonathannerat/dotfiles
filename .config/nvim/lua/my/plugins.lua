local M = {}

local packages = {

	'asciidoc/vim-asciidoc',
	'cohama/lexima.vim',
	'editorconfig/editorconfig-vim',
	'folke/tokyonight.nvim',
	'kdheepak/lazygit.nvim',
	'lambdalisue/suda.vim',
	'lervag/vimtex',
	'mcchrish/nnn.vim',
	'mhinz/vim-startify',
	'nvim-treesitter/nvim-treesitter-textobjects',
	'ray-x/lsp_signature.nvim',
	'sainnhe/gruvbox-material',
	'tpope/vim-commentary',
	'tpope/vim-fugitive',
	'tpope/vim-obsession',
	'tpope/vim-surround',
	'vim-pandoc/vim-pandoc',

	['arrufat/vala.vim']           = { ft = 'vala' },
	['cakebaker/scss-syntax.vim']  = { ft = 'scss' },
	['cespare/vim-toml']           = { ft = 'toml' },
	['embark-theme/vim']           = { as = 'embark-theme' },
	['gkz/vim-ls']                 = { as = 'livescript-syntax', ft = 'ls' },
	['glacambre/firenvim']         = { run = ':call firenvim#install(0)' },
	['leafo/moonscript-vim']       = { ft = 'moon' },
	['neomutt/neomutt.vim']        = { ft = { 'mutt', 'neomutt' } },
	['nvim-telescope/telescope-fzf-native.nvim'] = { run = 'make' },
	['nvim-treesitter/playground'] = { run = ':TSUpdate query' },
	['tbastos/vim-lua']            = { ft = 'lua' },
	['vim-pandoc/vim-pandoc-syntax'] = { ft = 'pandoc' },

	['neovim/nvim-lspconfig'] = {
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

				require'lsp_signature'.on_attach {
					bind = true,
					doc_lines = 2,
					hint_enable = false,
					handler_opts = {
						border = 'single',
					}
				}
			end

			local lsp_servers = {
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

			lsp_servers.sumneko_lua.cmd = {
				'/home/jonathan/.local/src/lua-language-server/bin/Linux/lua-language-server',
				'-E',
				'/home/jonathan/.local/src/lua-language-server/main.lua'
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					'documentation',
					'detail',
					'additionalTextEdits',
				}
			}

			for lsp, config in pairs(lsp_servers) do
				if not config.on_attach    then config.on_attach    = on_attach end
				if not config.capabilities then config.capabilities = capabilities end

				lspconfig[lsp].setup(config)
			end
		end
	},

	['iamcco/markdown-preview.nvim'] = {
		run = 'cd app && yarn install',
		ft = { 'markdown', 'pandoc.markdown', 'rmd' }
	},

	['hrsh7th/nvim-compe'] = {
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

	['nvim-treesitter/nvim-treesitter'] = {
		run = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = "maintained",
				-- Modules
				highlight = { enable = true, },
				incremental_selection = { enable = true, },
				indent = { enable = true, },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
						}
					}
				}
			}
		end
	},

	['hoob3rt/lualine.nvim'] = {
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
					theme = require'my.custom'.lualine_theme,
				},
				extensions = { 'fzf', 'fugitive' }
			}
		end
	},

	['folke/trouble.nvim'] = {
		config = function()
			require'trouble'.setup{
				icons = false
			}
		end
	},

	['nvim-telescope/telescope.nvim'] = {
		requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
		config = function()
			require'my.plugins.telescope'.config()
		end
	},

	['L3MON4D3/LuaSnip'] = {
		config = function()
			require'my.snippets'.setup()
		end
	},

	['norcalli/nvim-colorizer.lua'] = {
		config = function()
			require'colorizer'.setup(nil, { css=true })
		end
	},
}

function M.setup()
	require'packer'.startup(function(use)
		use { 'wbthomason/packer.nvim', opt = true }
		for k, package in pairs(packages) do
			if type(k) == 'number' then
				package = { package }
			elseif type(k) == 'string' then
				package[1] = k
			end

			use(package)
		end
	end)
end

return M
