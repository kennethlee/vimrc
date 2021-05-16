return {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}
