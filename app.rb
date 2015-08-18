require './lib/to_do.rb'
require 'sinatra/reloader'
require './lib/list.rb'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'

DB = PG.connect({:dbname => "to_do_test"})

get('/') do
  erb(:index)
end

get('/add_lists') do
  erb(:add_list)
end

get('/view_lists') do
  erb(:view_lists)
end

get('list_tasks') do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_tasks)
end

post('/view_lists') do
  name = params.fetch('list_name')
  @list = List.new({:name => name, :id => nil})
  @list.save()
  erb(:view_lists)
end
