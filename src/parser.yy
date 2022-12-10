%skeleton "lalr1.cc"
%require "3.4"
%defines

%define api.token.constructor
%define api.value.type variant
%define parse.assert

%code requires {
#include <string>
class Driver;
}

%param { Driver& drv }

%locations

%define parse.trace
%define parse.error verbose

%code {
#include "driver.h"
#include <iostream>
#include <string>
}

%define api.token.prefix {TOK_}
%token
  END 0 "end of file"
  MINUS "-"
  PLUS "+"
  STAR "*"
  SLASH "/"
;
%token <int> NUMBER "number"
%type <int> exp

%printer { yyo << $$; } <*>

%%

%start unit;
unit: exp { 
            drv.result = $1; 
}
  ;

%left "+" "-";
%left "*" "/";

exp: "number"
  | exp "+" exp { $$ = $1 + $3; }
  | exp "-" exp { $$ = $1 - $3; }
  | exp "*" exp { $$ = $1 * $3; }
  | exp "/" exp { $$ = $1 / $3; }
  ;

%%

void yy::parser::error(const location_type& loc, const std::string& m) {
  std::cerr << loc << ": " << m << std::endl;
}
