#shellcheck shell=sh

Describe "cat_lat_and_lon_files"
  It "returns CSV"
    When call src/cat_lat_and_lon_files tests/data/poligonos.json alacranes
    The first line of stdout should equal "lat,lon"
    The second line of stdout should equal "22.56880685,-89.75706064"
    The line 23 of stdout should equal "22.56885337,-89.76110809"
    The line 24 of stdout should equal "22.56880685,-89.75706064"
  End
End
