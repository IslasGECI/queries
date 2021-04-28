#shellcheck shell=sh

Describe "help options"
  It "Shows usage when called on queries"
    When call queries --help
    The first line of stdout should equal "Usage: queries [OPTIONS] COMMAND [ARGS]..."
  End
  It "Shows usage when called on select-growth-rates-and-p-values"
    When call queries select-growth-rates-and-p-values --help
    The first line of stdout should equal "Usage: queries select-growth-rates-and-p-values [OPTIONS]"
  End
    It "Shows usage when called on cambia-formato-fecha"
    When call queries cambia-formato-fecha --help
    The first line of stdout should equal "Usage: queries cambia-formato-fecha [OPTIONS]"
  End
End
