# require 'odbc'
# require 'sequel'
class XlsWithOdbc
#   DSN  = 'Myodbc'
#   USER = 'YourName'
#   PWD  = '123'
#
#   def self.convertion_data
#     binding.pry
#     # ODBC.connect(DSN, USER, PWD) do |dbh|
#     #   binding.pry
#     #   dbh.autocommit = true
#     #   begin
#     #     dbh.do("DROP TABLE test")
#     #   rescue ODBC::Error; end
#     #   dbh.do("CREATE TABLE test (id INT, name VARCHAR(30))")
#     #   dbh.do("INSERT INTO test VALUES (?,?)", 1, 'Michael')
#     #   dbh.autocommit = false
#     #   dbh.prepare("INSERT INTO test VALUES(?,?)") do |sth|
#     #     name = "AAAAA"
#     #     99.times {|n| sth.execute(n+2, name.succ!) }
#     #   end
#     #   dbh.commit
#     #   dbh.run("SELECT COUNT(*) FROM test") do |sth|
#     #     p sth.fetch[0]  # => 100
#     #   end
#     #   sql = "SELECT name FROM test WHERE id BETWEEN ? AND ?"
#     #   sth = dbh.run(sql, 49, 50)
#     #   sth.ignorecase = true
#     #   sth.fetch_hash do |row|
#     #     p row['NAME']            # => "AAABW", "AAABX"
#     #   end
#     #   sth.drop
#     # end
#     Dir['*.xls'].each{|xls|
#       binding.pry
#       print "Check #{xls}"
#       @db = Sequel.ado(:conn_string=>"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#{xls}")
#       begin
#         @db.test_connection
#         puts " ok"
#       rescue Sequel::DatabaseConnectionError
#         puts " error"
#       end
#     }
#   end
end