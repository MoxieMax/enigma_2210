require './lib/enigma'
require 'date'

enigma = Enigma.new((File.open(ARGV[0], 'r')))

enigma.run_encrypt


# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818