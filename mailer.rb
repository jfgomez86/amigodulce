require 'rubygems'
require 'tmail'
require 'net/smtp'
require 'smtp_tls'
require 'yaml'

class Mailer
  REQUIRED_OPTS = %w(msg from to)
  HOST = "smtp.gmail.com"
  PORT = 587
  DOMAIN = "koombea.com"

  def initialize(username, password)
    @username, @password = username, password
    @smtp = Net::SMTP.new(HOST, PORT)
    @smtp.start(DOMAIN, @username, @password, 'plain')
  end

  def send_message(*args)
    @smtp.send_message(*args)
  end

end

if __FILE__ == $0
  def message_body(url)
    msg = <<-HERE
Saludos!

Se realizo el sorteo aleatorio del Amigo Dulce, y para saber quien te toco,
visita la siguiente url:

#{url}

Recuerda: La cuota del regalo son $20.000
** Solamente Dulces/Postres/Cerveza/InserteSuConsumibleAqui **

Si eres alergico o tienes preferencias (discriminaciones) por algun dulce
en particular, escribe un PostIt con tu nombre y el dulce y pegalo en un
lugar visible. O comunicalo publicamente.

PD: El codigo de AmigoDulceKoombea v0.2 lo puedes encontrar aqui:
    http://github.com/jfgomez86/amigodulce
--
Jose
    HERE
  end

  puts "Usuario"
  username = gets
  puts "Password"
  password = gets
  mailer = Mailer.new(username, password)
  mail = TMail::Mail.new
  mail.from = "jose.gomez@koombea.com"
  mail.subject = "[Koombea Team] Amigo Dulce"
  mails = YAML.load_file("mails.yml")
  mails.each do |url, email|
    mail.to = email
    mail.body = message_body(url)
    mailer.send_message(mail.to_s, mail.from, mail.to)
  end

end
