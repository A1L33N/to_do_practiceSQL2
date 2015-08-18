require './lib/to_do.rb'
require 'sinatra/reloader'
require './lib/list.rb'
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

get('/view_lists') do
  erb(:view_lists)
end

get('/list_tasks/:id') do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_tasks)
end

post('/view_lists') do
  name = params.fetch('list_name')
  @list = List.new({:name => name, :id => nil})
  @list.save()
  erb(:view_lists)
end


post('/list_tasks/:id') do
  due_date = '2015-08-16 00:00:00'
  description = params.fetch('description')
  list_id = params.fetch('list_id').to_i
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id, :due_date => due_date })
  @task.save

  erb(:list_tasks)

end

get('/clear_lists') do
  List.clear
  erb(:index)
end
