module JS-CORE-SYNTAX

syntax Pgm ::= Stmt

syntax Stmt ::= "%fdecl" "(" Var "," Exps "," Stmt ")"
              | "%vdecl" "(" Var ")"
              | "%seq" "(" Stmt "," Stmt ")"
              | "%exp" "(" Exp ")"
              | "%if" "(" Exp "," Stmt "," Stmt ")"
              | "%do" "(" Stmt "," Exp ")"
              | "%while" "(" Exp "," Stmt ")"
              | "%for"   "(" Stmt "," Exp "," Exp "," Stmt ")" // for ( _ ; _ ; _ ) _
              | "%forin" "(" Stmt "," Exp "," Exp "," Stmt ")" // for ( _ _ in _ ) _
              | "%continue" "(" Var ")"
              | "%break" "(" Var ")"
              | "%label" "(" Var "," Stmt ")"
              | "%return" "(" Exp ")"
              | "%throw" "(" Exp ")"
              | "%try" "(" Stmt "," Var "," Stmt "," Stmt ")" // try _ catch ( _ ) _ finally _
              | "%try" "(" Stmt ","                  Stmt ")" // try _               finally _ // NOTE: this is hard to be represented in the above general form
              | "%with" "(" Exp "," Stmt ")"
              | "%emptyStmt"
              | "%print" "(" Exp ")"

syntax Exp ::= "%con" "(" Const ")"
             | "%var" "(" Var ")"
             | "%arr" "(" Exps ")"
             | "%obj" "(" Exps ")"
             | "%prop" "(" Var "," Exp ")"
             | "%get" "(" Var "," Stmt ")"
             | "%set" "(" Var "," Var "," Stmt ")"
             | "%mem" "(" Exp "," Exp ")"
             | "%new" "(" Exp "," Exps ")"
             | "%call" "(" Exp "," Exps ")"
             | "%comma" "(" Exp "," Exp ")"
             | "%pre" "(" Op "," Exp ")"
             | "%post" "(" Exp "," Op ")"
             | "%bop" "(" Op "," Exp "," Exp ")"
             | "%cond" "(" Exp "," Exp "," Exp ")"
             | "%emptyExp"
             | "%fun" "(" Var "," Exps "," Stmt ")"
             | "%fun" "("         Exps "," Stmt ")"

syntax Exps ::= "%cons" "(" Exp "," Exps ")"
              | "%nil"

syntax Const ::= "%this"
               | "%null"
               | Bool
               | Int
               | Float
               | String

syntax Var ::= String

syntax Op ::= "%inc" | "%dec"
            | OpNormal
            | OpShortcut
            | OpAssign

syntax OpNormal ::= "%plus" | "%minus" | "%tilde" | "%bang"
                  | "%delete" | "%void" | "%typeof"
                  | "%times" | "%div" | "%mod"
                  | "%lshift" | "%rshift" | "%rshiftshift"
                  | "%lt" | "%gt" | "%le" | "%ge"
                  | "%instanceof" | "%in"
                  | "%eq" | "%neq" | "%eqs" | "%neqs"
                  | "%amp" | "%caret" | "%bar"

syntax OpShortcut ::= "%and" | "%or"

syntax OpAssign ::= "%assign"
                  | "%timesassign" | "%divassign" | "%modassign"
                  | "%plusassign" | "%minusassign"
                  | "%lshiftassign" | "%rshiftassign" | "%rshiftshiftassign"
                  | "%ampassign" | "%caretassign" | "%barassign"

endmodule