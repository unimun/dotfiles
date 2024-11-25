local opt = vim.opt

opt.relativenumber = false -- Relative line numbers
opt.tabstop = 4 -- Number of spaces tabs count for

local map = vim.keymap.set

map("n", "<leader>tn", ":tabnew<cr>", { desc = "Open a new tab page with an empty window" })
map("n", "<leader>to", ":tabnew<cr>", { desc = "Close all other tab pages" })
map("n", "<leader>tc", ":tabclose<cr>", { desc = "Close current tab page" })
map("n", "<leader>tr", ":.+1,$tabdo :tabc<cr>", { desc = "Close tab pages to right" })
map(
  "n",
  "<leader>te",
  ':lua vim.cmd("tabedit " .. vim.fn.expand("%:p:h") .. "/")<CR>',
  { desc = "Open a new tab with the current buffer's path" }
)
map("t", "kj", "<C-\\><C-n>", { desc = "Escape to normal mode" })
map("i", "kj", "<C-\\><C-n>", { desc = "Escape to normal mode" })

-- Function to copy text using the yank script
local function yank(text)
  vim.system({ "yank" }, { stdin = text }, function(result)
    if not result.code then
      io.stderr:write("Yank Error: " .. result.stdout)
    else
      local tty_path = os.getenv("SSH_TTY")
      if not tty_path then
        io.stderr:write("SSH_TTY not set")
        return
      end
      local tty = io.open(tty_path, "wb")
      if tty then
        tty:write(result.stdout)
        tty:close()
      else
        io.stderr:write("Failed to write to " .. tty_path)
      end
    end
  end)
end

-- Map Leader + y to yank the selected text
map("n", "<Leader>y", [[:lua yank(vim.fn.getreg('"'))<CR>]], { noremap = true, silent = true })

-- Automatically run yank when yanking text in Vim
local function copy_yank()
  local reg_contents = vim.v.event.regcontents
  if reg_contents then
    yank(table.concat(reg_contents, "\n"))
  end
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = copy_yank,
})
