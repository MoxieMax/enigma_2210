module Encryptable
  def cipher(input, key)
    input.each_char.map { |char| alphabet.include?(char) ?
      alphabet[(alphabet.index(char)+key) % 27] : c }.join
  end

  def encode(input)
    msg = input.split('')
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
  
  def run_encrypt
    @message = (File.open(ARGV[0], 'r')).read.downcase
    encrypt(message, key, date)
    output_file = File.open(ARGV[1], 'w')
    output_file.write(encode(message))
    output_file.close
    print_encrypt
  end
  
  def print_encrypt
    puts "Created #{ARGV[1]} with the key #{key} and the date #{date}"
  end
  
end