clang                                   \
  -I ../tree-sitter/include                \
  test-c-parser.c                    \
  ../tree-sitter-c/src/parser.c         \
  ../tree-sitter/out/Release/obj.target/libruntime.a \
  -o test-c-parser

./test-c-parser
