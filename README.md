# Tree sitter C parse example:

An example to use tree-sitter with C code.

## Test case:

This example parses this example c code:

```
#include <stdio.h>
int main()
{
   int i, j, rows;

   printf("Enter number of rows: ");
   scanf("%d",&rows);

   for(i=1; i<=rows; ++i)
   {
      for(j=1; j<=i; ++j)
      {
         printf("* ");
      }
      printf("\n");
   }
   return 0;
}
```

## Running:

Clone https://github.com/tree-sitter/tree-sitter and this repo https://github.com/albfan/tree-sitter-c-parser-example at same level, then compile tree-sitter:

```
git clone https://github.com/tree-sitter/tree-sitter
git clone https://github.com/tree-sitter/tree-sitter-c-parser-example
cd tree-sitter
scan-build script/configure
./script/ci
cd ..
```

then go to this repo and try example:

```
cd  tree-sitter-c-parser-example
./test.sh
```

## Expected result:

```
Syntax tree: (translation_unit (preproc_include (system_lib_string)) (function_definition (primitive_type) (function_declarator (identifier) (parameter_list)) (compound_statement (declaration (primitive_type) (identifier) (identifier) (identifier)) (expression_statement (call_expression (identifier) (argument_list (string_literal)))) (expression_statement (call_expression (identifier) (argument_list (string_literal) (pointer_expression (identifier))))) (for_statement (assignment_expression (identifier) (number_literal)) (relational_expression (identifier) (identifier)) (math_expression (identifier)) (compound_statement (for_statement (assignment_expression (identifier) (number_literal)) (relational_expression (identifier) (identifier)) (math_expression (identifier)) (compound_statement (expression_statement (call_expression (identifier) (argument_list (string_literal)))))) (expression_statement (call_expression (identifier) (argument_list (string_literal)))))) (return_statement (number_literal)))))
```

## Quirks

I need to fix several things to make this work:

- disable json grammar `script/fetch-fixtures` due to a fail building
- set python as python2 `ln -sf /usr/bin/python2.7 /usr/bin/python` to compile gyp dep for tree-sitter

## Documentation

- http://tree-sitter.github.io/tree-sitter
