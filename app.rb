require 'rubygems'
require 'scrabbler'
require 'sinatra'

get "/my/:name" do
  encrypted = File.read("result.txt").chomp
  Scrabbler.decrypt(encrypted)[ params[:name].split(/_/).join(" ") ]
end
