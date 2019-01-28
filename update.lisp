(fn sql-clause-update (&key table fields (where nil))
  (+ "UPDATE " table
	 " SET " (apply #'+ (pad (@ [sql= _. ._] fields) ","))
	 (sql-clause-where where)))
