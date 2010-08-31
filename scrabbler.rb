require 'yaml'
require 'digest/sha1'
require 'pp'

class Scrabbler

  def initialize(list_file)
    @entries = File.read(list_file).split(/\n/).map(&:downcase)
    @people = @entries.dup
  end

  def start
    result = {}
    while !@people.empty? do
      actual = choose_random!(@people)
      result[Digest::SHA1.hexdigest(Time.now.to_s + "KOOMBEA" + rand.to_s)] = {actual => choose_random!(@entries, actual)}
    end
    pp result.map {|k,v| {k => v.to_a.flatten[0] } }
    r_string = YAML.dump(result).unpack("H*")
    File.open("result.txt", "w") { |f| f.puts(r_string) }
  end

  def choose_random!(from, exclude = nil)
    from.shuffle!(&:rand) while from.first == exclude
    from.shift
  end

  def self.decrypt(something)
    YAML.load([ something ].pack("H*"))
  end
end

if __FILE__ == $0
  app = Scrabbler.new("people.txt")
  app.start
end
