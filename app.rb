require 'rubygems'
require 'sinatra'
require 'scrabbler'

get "/my/:name" do
  encrypted = File.read("result.txt").chomp
  Scrabbler.decrypt(encrypted)[ params[:name].split(/_/).join(" ") ]
end
