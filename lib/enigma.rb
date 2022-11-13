require 'date'

class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end
  
  def random_key
    rand(00000..99999).to_s.rjust(5, "0")
    # r_key = num.to_s.rjust(5, "0")
  end
  
  def encrypt_date
    #if there's no given date, use today's date as a "mmddyy" string
    Date::today.strftime('%d%m%y')
  end
  #make shifts
  
  def key_split(key)
    array = key.split("")
    a_key = [array[0], array[1]].join
    b_key = [array[1], array[2]].join
    c_key = [array[2], array[3]].join
    d_key = [array[3], array[4]].join
    key_array = [a_key, b_key, c_key, d_key]
  end  
  
  
  # def encrypt(message, key = nil, date = nil)
  #   hash = {
  #           encryption: message, #encrypted message
  #           key: random_key, #random 5 numbers
  #           date: encrypt_date #DDMMYY
  #           }
  # end
    #returns a hash with 3 keys
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