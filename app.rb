require './lib/to_do.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'

DB = PG.connect({:dbname => "to_do"})

get('/') do
  erb(:index)
end

get('/add_lists') do
  erb(:add_list)
end

post('/view_list') do
  name = params.fetch('list_name')
  list = List.new({:name => name, id => nil})
  list.save()
  erb(:view_list)
end
