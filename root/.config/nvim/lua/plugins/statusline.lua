require("mini.icons").setup()
require("mini.git").setup()
require("mini.diff").setup()
require('mini.statusline').setup({
    content = {
        -- Layout matching lualine:
        -- lualine_a: filename (with mode colors)
        -- lualine_b: diff
        -- lualine_c: (empty)
        -- lualine_x: location, filetype
        -- lualine_y: branch
        -- lualine_z: filesize
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local filename = MiniStatusline.section_filename()
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local location = MiniStatusline.section_location()
            local fileinfo = MiniStatusline.section_fileinfo()
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            -- local filesize = get_filesize()


            return MiniStatusline.combine_groups({
                { hl = mode_hl,                 strings = { filename } },  -- lualine_a
                { hl = 'MiniStatuslineDevinfo', strings = { diff } },      -- lualine_b
                '%<',                                                      -- Truncate point
                '%=',                                                      -- Right align
                { hl = 'MiniStatuslineFileinfo', strings = { location } }, -- lualine_x
                "│",
                { hl = 'MiniStatuslineDevinfo',  strings = { git } },      -- lualine_y
                { hl = mode_hl,                  strings = { fileinfo } }, -- lualine_z
            })
        end,
        -- inactive = function()
        --     local filename = MiniStatusline.section_filename({ trunc_width = 140 })
        --     return MiniStatusline.combine_groups({
        --         { hl = 'MiniStatuslineInactive', strings = { filename } },
        --     })
        -- end,
    },
    use_icons = true,
})

-- Define custom highlight groups for each mode
vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', {
    bg = '#82AAFF', -- Blue background
    fg = '#282a36', -- White text
    bold = true,
})

vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', {
    bg = '#C3E88D', -- Green background
    fg = '#282a36', -- Dark text
    bold = true,
})

vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', {
    bg = '#B480D6', -- Pink/Magenta background
    fg = '#282a36', -- Dark text
    bold = true,
})

vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', {
    bg = '#DC6068', -- Orange background
    fg = '#282a36', -- Dark text
    bold = true,
})

vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', {
    bg = '#E6B455', -- Yellow background
    fg = '#282a36', -- Dark text
    bold = true,
})

vim.api.nvim_set_hl(0, 'MiniStatuslineModeOther', {
    bg = '#DC6068', -- Cyan background
    fg = '#282a36', -- Dark text
    bold = true,
})

MiniStatusline.section_fileinfo = function()
    local filetype = vim.bo.filetype

    -- Add filetype icon
    if _G.MiniIcons ~= nil and filetype and filetype ~= '' then
        local icon = _G.MiniIcons.get('filetype', filetype)
        if icon then filetype = icon end
    end

    -- Construct output string with extra file info
    local size = get_filesize()
    return string.format('%s %s', filetype, size)
end

MiniStatusline.section_filename = function()
    return '%t%m%r'
end

MiniStatusline.section_location = function()
    return '%l:%v'
end


get_filesize = function()
    local size = math.max(vim.fn.line2byte(vim.fn.line('$') + 1) - 1, 0)
    if size < 1024 then
        return string.format('%dB', size)
    elseif size < 1048576 then
        return string.format('%.2fKiB', size / 1024)
    else
        return string.format('%.2fMiB', size / 1048576)
    end
end

----- mini.diff -----
local format_summary = function(data)
    local summary = vim.b[data.buf].minidiff_summary
    local t = {}

    if summary.add > 0 then
        table.insert(t, '%#DiffAdd#+' .. summary.add .. '%#Normal#')
    end
    if summary.change > 0 then
        table.insert(t, '%#DiffChange#~' .. summary.change .. '%#Normal#')
    end
    if summary.delete > 0 then
        table.insert(t, '%#DiffDelete#-' .. summary.delete .. '%#Normal#')
    end

    vim.b[data.buf].minidiff_summary_string = table.concat(t, ' ')
end

local au_opts = { pattern = 'MiniDiffUpdated', callback = format_summary }
vim.api.nvim_create_autocmd('User', au_opts)
