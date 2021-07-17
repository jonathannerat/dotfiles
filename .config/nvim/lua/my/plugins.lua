local M = {}

local packages = {
	'asciidoc/vim-asciidoc',
	'cohama/lexima.vim',
	'editorconfig/editorconfig-vim',
	'folke/tokyonight.nvim',
	'lambdalisue/suda.vim',
	'lervag/vimtex',
	'mcchrish/nnn.vim',
	'nvim-treesitter/nvim-treesitter-textobjects',
	'rafamadriz/neon',
	'ray-x/lsp_signature.nvim',
	'sainnhe/gruvbox-material',
	'tpope/vim-commentary',
	'tpope/vim-fugitive',
	'tpope/vim-surround',
	'vhyrro/tree-sitter-norg',
	'vim-pandoc/vim-pandoc',

	[ 'wbthomason/packer.nvim' ]   = { opt = true },
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
		config = function() require'my.plugins.lspconfig'.config() end
	},

	['folke/todo-comments.nvim'] = {
		requires = 'nvim-lua/plenary.nvim',
		config = function () require'todo-comments'.setup {} end
	},

	['andweeb/presence.nvim'] = {
		config = function() require'presence':setup() end
	},

	['sunjon/shade.nvim'] = {
		config = function()
			require'shade'.setup {
				overlay_opacity = 50,
				opacity_step = 5,
			}
		end
	},

	['L3MON4D3/LuaSnip'] = {
		config = function() require'my.snippets'.setup() end
	},

	['norcalli/nvim-colorizer.lua'] = {
		config = function()
			require'colorizer'.setup(nil, { css=true })
		end
	},

	['folke/trouble.nvim'] = {
		config = function()
			require'trouble'.setup{
				icons = false
			}
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
					neorg = true,
				}
			}
		end
	},

	['nvim-treesitter/nvim-treesitter'] = {
		run = ':TSUpdate',
		config = function()
			local parser_configs = require'nvim-treesitter.parsers'.get_parser_configs()

			parser_configs.norg = {
				install_info = {
					url = 'https://github.com/vhyrro/tree-sitter-norg',
					files = { 'src/parser.c' },
					branch = 'main'
				}
			}

			require'nvim-treesitter.configs'.setup {
				ensure_installed = "maintained",
				-- Modules
				highlight = { enable = true, },
				incremental_selection = { enable = true, },
				indent = { enable = true, },
				playground = { enable = true },
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

	['nvim-telescope/telescope.nvim'] = {
		requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
		config = function() require'my.plugins.telescope'.config() end
	},

	['vhyrro/neorg'] = {
		config = function()
			require'neorg'.setup {
				load = {
					['core.defaults'] = {},
					['core.keybinds'] = {
						config = { default_keybinds = true }
					},
					['core.norg.concealer'] = {},
					['core.norg.dirman'] = {
						config = { workspaces = { notes = '~/docs/notes' } }
					},
				}
			}
		end
	},

	['folke/persistence.nvim'] = {
		config = function()
			require'my.plugins.persistence'.config()
		end
	},
}

local function packer_setup(use)
		for k, package in pairs(packages) do
			if type(k) == 'number' then
				package = { package }
			elseif type(k) == 'string' then
				package[1] = k
			end

			use(package)
		end
end

function M.setup()
	require'packer'.startup {
		packer_setup,
		config = {
			display = {
				open_fn = function()
					return require'packer.util'.float { border = 'single' }
				end
			},
			profile = {
				enabled = true,
				threshold = 1,
			}
		}
	}
end

return M
