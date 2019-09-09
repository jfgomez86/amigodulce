require 'rubygems'
require 'pony'
require 'yaml'
require 'ostruct'

class Mailer
  Config = OpenStruct.new(
    :smtp_address => 'smtp.gmail.com',
    :smtp_port => '587',
  )


  def initialize(username, password)
    @username, @password = username, password
  end

  def send_message(recipient, subject, from, body)
    Pony.mail(:from => from,
              :to => recipient,
              :subject => subject,
              :via => :smtp, :via_options => {
      :address              =>  Config.smtp_address,
      :port                 =>  Config.smtp_port,
      :enable_starttls_auto => true,
      :user_name            =>  @username,
      :password             =>  @password,
      :authentication       => :plain,
      :domain               => "koombea.com"
    }, :body => body)
  end

end

if __FILE__ == $0
  def message_body(url)
    msg = <<-HERE
Hola!

Para saber quien es tu amigo secreto, visita el siguiente link:

#{url}

Para conocer las preferencias de tu Amigo Secreto puedes ingresar a la
siguiente url. El valor sugerido es $50.000.

https://docs.google.com/spreadsheets/d/1A2Kza2IIwRO88gcapvMf5JxZG3J0qiG6tBb-aSTK75M/edit?usp=sharing

PD: El codigo de AmigoDulceKoombea v0.2 lo puedes encontrar aqui:
   http://github.com/jfgomez86/amigodulce

--
Totally not a bot ("o_o)
    HERE
  end

  puts "Usuario"
  username = gets
  puts "Password"
  password = gets
  mailer = Mailer.new(username, password)
  from = "jose.gomez@koombea.com"
  subject = "[Koombea Team] Amigo Dulce"
  mails = YAML.load_file("mails.yml")
  mails.each do |url, email|
    print "Enviando correo a #{email}..."
    body = message_body(url)
    mailer.send_message(email, subject, from, body)
    puts "ok!"
  end

end
