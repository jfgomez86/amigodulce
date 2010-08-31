require 'rubygems'
require 'scrabbler'
require 'sinatra'

get "/:token/:name" do
  encrypted = File.read("result.txt").chomp
  data = Scrabbler.decrypt(encrypted)
  name = params[:name].split(/_/).join(" ")
  if data.key?(params[:token]) && data[params[:token]].key?(name)
    data[params[:token ]][name]
  else
    "Nadie me quiere...todos me odian... voy a comerme un gusaniitoo :("
  end
end
