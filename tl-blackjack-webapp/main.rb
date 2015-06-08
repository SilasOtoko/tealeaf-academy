require 'rubygems'
require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

set :sessions, true

get '/inline' do 
  "Hi, directly from the action!"
end

get '/template' do
  erb :mytemplate
end

get '/nested_template' do
  erb :"/users/profile"
end

get '/nothere' do
  redirect '/inline'
end

