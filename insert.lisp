(fn sql-clause-insert (&key table (fields nil) (default-values-if-empty? nil))
  (concat-stringtree    ; TODO: Concat properly.
      "INSERT INTO " table
      (? (empty-string-or-nil? fields)
         (? default-values-if-empty?
            " DEFAULT VALUES"
            " VALUES()")
         (concat-stringtree
             " ("
             (pad (filter [? (symbol? _)
                             (downcase (symbol-name _))
                             _]
                          (carlist fields))
                  ",")
             ") VALUES ("
             (pad (@ [+ "\"" (escape-string _) "\""] (cdrlist fields)) ",")
             ")"))))
