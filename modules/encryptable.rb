module Encryptable
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

  def encrypt(message, key, date = encrypt_date)
    hash = {
            encryption: encode(message),
            key: key,
            date: date
            }
  end
end