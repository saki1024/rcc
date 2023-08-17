file(REMOVE_RECURSE
  "librcc_stdlib.a"
  "librcc_stdlib.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/rcc_stdlib.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
