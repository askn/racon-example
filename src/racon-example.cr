require "racon"
require "./racon-example/*"

db = DB.new(File.read("./config.yml"))

racon = Racon::Config.new

racon.add_resource(Customer)
racon.add_resource(LineItem)
racon.add_resource(Order)
racon.add_resource(Product)

racon.resources.each do |resource|
  add_resource_to_routes racon, db, resource
end

get "/" do |env|
  env.redirect "/" + racon.resources.first.table_name + "/"
end

Kemal.run
