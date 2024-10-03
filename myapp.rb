require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/todos.sqlite3"}

class Todo < ActiveRecord::Base
    validates :description, presence: true
end

get '/' do
    erb :index
end

post '/todos' do
    Todo.create(description: params[:description], done: false)
    redirect back
end

post '/todos/:id/do' do
    item = Todo.find(params[:id])
    item.done = true
    item.save
    redirect to('/')
end

post '/todos/clear' do
  Todo.delete_all
  redirect to('/')
end
