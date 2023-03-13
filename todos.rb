require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

def lists
  if session[:lists].nil?
    todo_1 = {name: 'task_one', completed: false}
    todo_2 = {name: 'task_two', completed: false}
    session[:lists] = [{name: "list 1", todos: [todo_1, todo_2]}]
  else
    session[:lists]
  end
end

configure do
  enable :sessions
end

get "/" do
  @lists = lists
  # session[:message] = "test message"
  erb :lists
end