require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/answer.rb'
require 'csv'

use Rack::Session::Cookie

get '/' do
  erb :index
end

post '/confirm' do
  session[:name]  = params[:name]
  session[:email] = params[:email]
  session[:gender] = params[:gender]
  session[:color] = params[:favoColors]
  session[:item] = params[:item]
  session[:price] = params[:price]
  session[:free_text] = params[:freeText]
  redirect '/confirm'
end

get '/confirm' do
  @name = session[:name]
  @email = session[:email]
  @gender = session[:gender]
  @color = session[:color]
  @item = session[:item]
  @price = session[:price]
  @free_text = session[:free_text]
  erb :confirm
end

post '/new' do
  Answer.create({
    name: session[:name],
    email: session[:email],
    gender: session[:gender],
    color: session[:color],
    free_text: session[:free_text],
    item: session[:item],
    money: session[:price]
    })
  redirect '/finish'
end

get '/finish' do
  erb :finish
end

get '/list' do
  @answers = Answer.all
  erb :list
end