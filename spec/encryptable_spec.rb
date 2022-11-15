require './spec_helper'

RSpec.describe Encryptable do
  
  let (:enigma) {Enigma.new(message, key, date)}
  let (:message) {'hello world'}
  let (:key) {'02715'}
  let (:date) {'040895'}
  
  describe '#cipher' do
    it 'encodes a string based on the given key' do
      expect(enigma.cipher('h', 3)).to eq('k')
      expect(enigma.cipher('e', 27)).to eq('e')
      expect(enigma.cipher('l', 73)).to eq('d')
      expect(enigma.cipher('l', 20)).to eq('e')
      expect(enigma.cipher('o', 3)).to eq('r')
      expect(enigma.cipher('hello', 3)).to eq('khoor')
    end
  end
  
  describe '#encode' do
    it 'encodes each letter in a string using #cipher' do
      expect(enigma.encode(message)).to eq('keder ohulw')
    end
  end
end