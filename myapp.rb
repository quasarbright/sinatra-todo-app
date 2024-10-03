require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/todos.sqlite3"}
enable :sessions
set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

class Todo < ActiveRecord::Base
    validates :description, presence: true
end

before do
  if not session[:username] and request.path_info != "/login"
    redirect to('/login')
  end
end

get '/' do
    @items = Todo.where(username: session[:username]).order(done: :asc)
    erb :index
end

post '/todos' do
    Todo.create(description: params[:description], done: false, username: session[:username])
    redirect back
end

post '/todos/:id/do' do
    item = Todo.find(params[:id])
    item.done = true
    item.save
    redirect to('/')
end

post '/todos/clear' do
    Todo.destroy_by(username: session[:username])
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
