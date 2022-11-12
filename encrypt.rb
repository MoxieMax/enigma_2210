initial_msg = File.open(ARGV[0], 'r')
message = input_file.read
prepare_message = message.downcase #.gsub(/[^\w\s]/, '').chars #not converting characters other than letters and spaces, shouldn't need gsub


# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818