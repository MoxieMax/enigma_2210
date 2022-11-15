require './lib/enigma'

# message = 'hello world' #default for testing
key = '02715' #default for testing
date = '040895' #default for testing

# enigma = Enigma.new(message, key, date)
input_file = File.open(ARGV[0], 'r')
file_txt = input_file.read
message = file_txt.downcase
enigma = Enigma.new(message, key, date)
# prepare_message = message.downcase

encrypted = File.open(ARGV[1], 'w')
encrypted.write(enigma.encode(message)) #should be the encrypted string
encrypted.close

# message = 'hello world' #default for testing
# key = '02715' #default for testing
# date = '040895' #default for testing
# key = enigma.random_key
# date = enigma.encrypt_date

puts "Created #{ARGV[1]} with the key #{key} and the date #{date}"



# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818