local add = vim.filetype.add
local ledger = "ledger"

add({
  extension = {
    dat = ledger,
    hledger = ledger,
    j = ledger,
    journal = ledger,
    ledger = ledger,
  },
})
