require './lib/enigma'
require 'date'

enigma = Enigma.new((ARGV[0]), ARGV[2], (ARGV[3]))

enigma.run_decrypt

# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 