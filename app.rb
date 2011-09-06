require 'rubygems'
require './scrabbler'
require 'sinatra'

get "/:token/:name" do
  encrypted = File.read("result.txt").chomp
  data = Scrabbler.decrypt(encrypted)
  name = params[:name].gsub(/_/, " ").upcase
  if data.key?(params[:token]) && data[params[:token]].keys.map(&:upcase).include?(name)
    data[params[:token ]].inspect
  else
    "Nadie me quiere...todos me odian... voy a comerme un gusaniitoo :("
  end
end
