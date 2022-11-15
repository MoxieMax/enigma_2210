require './spec_helper'

RSpec.describe Decryptable do
  
  let (:enigma) {Enigma.new(message, key, date)}
  let (:message) {'hello world'}
  let (:key) {'02715'}
  let (:date) {'040895'}
  
  describe '#decipher' do
    it 'decodes a string based on the given key' do
      expect(enigma.decipher('k', 3)).to eq('h')
      expect(enigma.decipher('e', 27)).to eq('e')
      expect(enigma.decipher('d', 73)).to eq('l')
      expect(enigma.decipher('e', 20)).to eq('l')
      expect(enigma.decipher('r', 3)).to eq('o')
      expect(enigma.decipher('khoor', 3)).to eq('hello')
    end
  end
  
  describe '#decode' do
    it 'decodes each letter in a string using #decipher' do
      expect(enigma.decode('keder ohulw')).to eq('hello world')
    end
  end
end