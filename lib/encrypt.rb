require './lib/enigma'
require 'date'

enigma = Enigma.new((File.open(ARGV[0], 'r').read.downcase))

enigma.run_encrypt


# $ ruby ./lib/encrypt.rb message.txt encrypted.txt