require 'pg'

def execute(sql)
  conn = PG::Connection.open(:dbname => 'sqlzoo')
  query_result = conn.exec(sql).values
  conn.close

  query_result
end
