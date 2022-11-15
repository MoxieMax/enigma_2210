require 'date'

class Enigma
  attr_reader :alphabet,
              :shifts,
              :message,
              :key,
              :date

  def initialize(message, key = random_key, date = encrypt_date)
    @alphabet = ("a".."z").to_a << " "
    @shifts = shift(key, date)
    @message = message
    @key = key
    @date = date
  end
  
  def random_key
    rand(00000..99999).to_s.rjust(5, "0")
    
  end
  
  def encrypt_date
    #if there's no given date, use today's date as a "mmddyy" string
    Date::today.strftime('%d%m%y')
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
  
  def cipher(input, key)
    input.each_char.map { |char| alphabet.include?(char) ?
      alphabet[(alphabet.index(char)+key) % 27] : c }.join
  end
  
  def encode(input)
    msg = input.split("")
    encoded = []
    until msg.empty?
      loop do
        encoded << cipher(msg.first, shifts[:a])
        msg.shift
        break if msg.empty?
        encoded << cipher(msg.first, shifts[:b])
        msg.shift
        break if msg.empty?
        encoded << cipher(msg.first, shifts[:c])
        msg.shift
        break if msg.empty?
        encoded << cipher(msg.first, shifts[:d])
        msg.shift
        break if msg.empty?
      end
    end
    encoded.join
  end
  
  def encrypt(message, key, date)
    hash = {
            encryption: encode(message),
            key: key,
            date: date
            }
  end
  
  def decipher(input, key)
    input.each_char.map { |char| alphabet.include?(char) ?
      alphabet[(alphabet.index(char)-key) % 27] : c }.join
  end
  
  def decode(input)
    msg = input.split("")
    decoded = []
    until msg.empty?
      loop do
        decoded << decipher(msg.first, shifts[:a])
        msg.shift
        break if msg.empty?
        decoded << decipher(msg.first, shifts[:b])
        msg.shift
        break if msg.empty?
        decoded << decipher(msg.first, shifts[:c])
        msg.shift
        break if msg.empty?
        decoded << decipher(msg.first, shifts[:d])
        msg.shift
        break if msg.empty?
      end
    end
    decoded.join
  end
  
  # def decrypt(message, key, date)
  #   hash = {
  #           decryption: decode(message),
  #           key: key,
  #           date: date
  #           }
  # end
end