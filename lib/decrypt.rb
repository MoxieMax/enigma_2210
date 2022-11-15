require './lib/enigma'
require 'date'
require './lib/encrypt'

# message = 'hello world' #default for testing
# key = '02715' #default for testing
# date = '040895' #default for testing


enigma.run_decrypt

# enigma = Enigma.new(message, key, date)
# input_file = File.open(ARGV[0], 'r')
# file_txt = input_file.read
# message = file_txt.downcase
# enigma = Enigma.new(message, '65701')
# # prepare_message = message.downcase
# 
# decrypted = File.open(ARGV[1], 'w')
# decrypted.write(enigma.decode(message)) #should be the decrypted string
# decrypted.close
# 
# puts "Created #{ARGV[1]} with the key #{enigma.key} and the date #{enigma.date}"



# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818