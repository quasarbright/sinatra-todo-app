require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/todos.sqlite3"}
enable :sessions
# It's really bad to hard-code the session secret for a real application ofc
set :session_secret, 'c167f882dbc9d9d4a2b6f959e223bc675e8d1c242dd09595d8fe2635535841461ff9c128b27cf031c8cf6d8eb714a7b4bb4012dab8ef5de7d25b46e79d585e70'

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

get '/login' do
    erb :login
end

post '/login' do
    session[:username] = params[:username]
    redirect to('/')
end

post '/logout' do
    session[:username] = nil
    redirect back
end
