local t = require'telescope'
local tp = require'telescope.previewers'

local M = {}

local function action_open(prompt_bufnr)

	local action_state = require'telescope.actions.state'
	local path = require'telescope.path'
	local entry = action_state.get_selected_entry()

	if not entry then
		print('[telescope] Nothing currently selected')
		return
	end

	local filename = entry.path or entry.filename

	if not filename then
		print('[telescope] No filename in selected entry')
	end

	filename = path.normalize(vim.fn.fnameescape(filename), vim.loop.cwd())

	local opener = 'xdg-open'

	if vim.fn.has('macunix') == 1 then
		opener = 'open'
	elseif vim.fn.has('win32') == 1 then
		opener = 'start'
	end

  require'telescope.actions'.close(prompt_bufnr)

	os.execute(string.format('%s %s', opener, filename))
end

function M.config()
	t.setup {
		defaults = {
			file_previewer = tp.vim_buffer_cat.new,
			grep_previewer = tp.vim_buffer_vimgrep.new,
			mappings = {
				i = {
					['<c-o>'] = action_open
				}
			}
		},
		extensions = {
			fzf = {
				override_generic_sorter = false,
				override_file_sorter = true,
				case_mode = 'smart_case',
			}
		}
	}

	t.load_extension('fzf')
end

return M
