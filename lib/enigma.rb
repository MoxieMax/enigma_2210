require 'date'
require './modules/generatable'
require './modules/encryptable'
require './modules/decryptable'

class Enigma
  
  include Generatable
  include Encryptable
  include Decryptable
  
  attr_reader :alphabet,
              :shifts,
              :message,
              :key,
              :date
              
  def initialize(message = (File.open(ARGV[0], 'r')).read.downcase, key = random_key, date = encrypt_date)
    @alphabet = ("a".."z").to_a << " "
    @shifts = shift(key, date)
    @message = message
    @key = key
    @date = date
  end
  
  def key_split(key)
    array = key.split("")
    a_key = [array[0], array[1]].join
    b_key = [array[1], array[2]].join
    c_key = [array[2], array[3]].join
    d_key = [array[3], array[4]].join
    key_array = a_key, b_key, c_key, d_key
  end  
  
  def offset(date)
    square = (date.to_i * date.to_i).to_s.split("")
    shift_array = square[-4..-1]
  end
  
  def shift(key, date)
    shift = {
              a: offset(date)[0].to_i + key_split(key)[0].to_i,
              b: offset(date)[1].to_i + key_split(key)[1].to_i,
              c: offset(date)[2].to_i + key_split(key)[2].to_i,
              d: offset(date)[3].to_i + key_split(key)[3].to_i
              }
  end
  
  def encrypt(message, key, date = encrypt_date)
    hash = {
            encryption: encode(message),
            key: key,
            date: date
            }
  end
  
  def decrypt(message, key, date = encrypt_date)
    hash = {
            decryption: decode(message),
            key: key,
            date: date
            }
  end
  
  def run_encrypt
    input_file = File.open(ARGV[0], 'r')
    @message = input_file.read.downcase
    encrypt(message, key, date)
    output_file = File.open(ARGV[1], 'w')
    output_file.write(encode(message))
    output_file.close
    print
  end
  
  def print
    puts "Created #{ARGV[1]} with the key #{key} and the date #{date}"
  end
  
end