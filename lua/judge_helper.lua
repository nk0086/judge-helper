-- atcoder_helper.lua

local M = {}

M.init() = function()
    M.commands = {
        rs = "cargo run",
    }

    M.ids = {
        rs = "5054",
    }

    if not vim.fn.isdirectory('test') then
        vim.cmd('!mkdir test')
    end

    if vim.fn.executable('oj') == 0 then
        print("Warning: oj is not installed")
    end

end

-- テストケースのダウンロード関数
M.atcoder_download = function()
    local filename = vim.fn.expand('%:t:r')
    local url = 'https://atcoder.jp/contests/' .. filename:sub(1, -3) .. '/tasks/' .. filename
    vim.cmd('!mkdir -p test/' .. filename)
    vim.cmd('!oj d -d test/' .. filename .. ' ' .. url)
end

-- テストケースの実行関数
M.atcoder_test = function()
    M.atcoder_download()
    local filename = vim.fn.expand('%:t')
    local ext = vim.fn.expand('%:e')
    local command = M.commands[ext] or "UNKNOWN_COMMAND"
    local test_dir = 'test/' .. vim.fn.expand('%:t:r')
    vim.cmd('!oj t -c "' .. command .. ' ' .. filename .. '" -d ' .. test_dir)
end

-- コードの提出関数
M.atcoder_submit = function()
    local filename = vim.fn.expand('%:t')
    local ext = vim.fn.expand('%:e')
    local id = M.ids[ext] or "UNKNOWN_ID"
    local url = 'https://atcoder.jp/contests/' .. filename:sub(1, -7) .. '/tasks/' .. filename:sub(1, -5)
    vim.cmd('!oj s -y -l ' .. id .. ' ' .. url .. ' ' .. filename)
end

-- コマンドの追加
vim.cmd('command! OJTest lua require"judge_helper".atcoder_test()')
vim.cmd('command! OJSubmit lua require"judge_helper".atcoder_submit()')

return M

