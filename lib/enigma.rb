
class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end
  
  def random_key
    num = rand(00000..99999)
    num.to_s.rjust(5, "0")
  end
  
  
  
  # def encrypt(message, key = nil, date = nil)
  #   hash = {
  #           encryption: , #encrypted message
  #           key: key, #random 5 numbers
  #           date: date #DDMMYY
  #           }
  #           #("a".."z").to_a << " " #alphabet plus space
  #   #returns a hash with 3 keys
  # # The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.
  # # :encryption => the encrypted String
  # # :key => the key used for encryption as a String
  # # :date => the date used for encryption as a String in the form DDMMYY
  # send
# 
#   def decrypt(message, key = nil, date = nil)
#   #The decrypt method takes a ciphertext String and the Key used for encryption as arguments. The decrypt method can optionally take a date as the third argument. If no date is given, this method should use today’s date for decryption.
# # :decryption => the decrypted String
# # :key => the key used for decryption as a String
# # :date => the date used for decryption as a String in the form DDMMYY
#   end
end