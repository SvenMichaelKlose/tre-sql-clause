(fn sql-clause-create-table (table-definition &key (auto-increment nil) (have-types? nil))
  (with (name  table-definition.
         cols  .table-definition.)
    (apply #'+ `("CREATE TABLE " ,name " ("
                 ,@(& auto-increment
                      `("id INTEGER PRIMARY KEY " ,auto-increment ","))
                 ,@(pad (@ [+ _. " " (? have-types? ._. "")] cols) ",")
                 ")"))))
