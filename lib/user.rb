require 'importex'
class User < Importex::Base
  column "email"
  column "password"
  column "status", :type => Boolean
end