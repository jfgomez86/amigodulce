require 'yaml'
require 'digest/sha1'
require 'pp'

class Scrabbler

  def initialize(list_file)
    @entries = YAML.load_file(list_file)
    @people = @entries.dup
  end

  def start
    result = {}
    mails = {}
    while !@people.empty? do
      actual = choose_random!(@people)
      result[token = generate_token] = {actual["name"] => choose_random!(@entries, actual)["name"]}
      mails[generate_url(actual["name"], token)] = actual["email"]
    end
    File.open("mails.yml", "w") {|f| f.puts YAML.dump(mails) }
    r_string = YAML.dump(result).unpack("H*")
    File.open("result.txt", "w") { |f| f.puts(r_string) }
  end

  def generate_token
    Digest::SHA1.hexdigest(Time.now.to_s + "KOOMBEA" + rand.to_s)
  end

  def choose_random!(from, exclude = nil)
    from.shuffle!(&:rand) while from.first == exclude
    from.shift
  end

  def generate_url(name, token)
    parsed_name = name.downcase.split(/\s/).join("_")
    "http://amigosecretokoombea.herokuapp.com/#{token}/#{parsed_name}"
  end

  def self.decrypt(something)
    YAML.load([ something ].pack("H*"))
  end
end

if __FILE__ == $0
  app = Scrabbler.new("people.yml")
  app.start
end
