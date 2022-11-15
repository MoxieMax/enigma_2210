module Decryptable
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
  
  def run_decrypt
    @message = (File.open(ARGV[0], 'r')).read
    output_file = File.open(ARGV[1], 'w')
    output_file.write(decode(message))
    output_file.close
    print_decrypt
  end
  
  def print_decrypt
    puts "Created #{ARGV[1]} with the key #{key} and the date #{date}"
  end
end