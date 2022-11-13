require 'spec_helper'

RSpec.describe Enigma do
  let (:enigma) {Enigma.new}
  let (:key) {'02715'}
  let (:date) {'040895'}
  
  describe '#initialize' do
    it 'creates new instance with alphabet + " " array' do
      expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
      expect(enigma.alphabet.count).to eq(27)
    end
  end
  
  describe '#random_key' do
    it 'generates a random 5 digit number' do
      expect(enigma.random_key.to_s.length).to eq(5)
    end
  end
  
  describe '#encrypt_date' do
    it 'formats the date for the encryption' do
      expect(enigma.encrypt_date.length).to eq(6)
      expect(enigma.encrypt_date).to be_a(String)
    end
  end
  
  describe '#key_split' do
    it 'creates an array and splits it for encryption' do
      expect(enigma.key_split(key)).to eq(["02", "27", "71", "15"])
      expect(enigma.key_split('12345')).to eq(["12", "23", "34", "45"])
    end
  end
  
  describe '#shift_split' do
    it 'splits' do
      expect(enigma.shift_split(date)).to eq([2, 5, 2, 5])
      expect(enigma.shift_split('121122')).to eq([8, 8, 8, 4])
    end
  end
  
  # describe '#encrypt' do
  #   it 'will generate a hash and translate a string' do
  #     expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  #   end
  # end
  
  # describe '#decrypt' do
  #   it 'will generate a hash and translate a string' do
  #     expect(enigma.encrypt("keder ohulw", "02715", "040895")).to eq({encryption: "hello world", key: "02715", date: "040895"})
  #   end
  # end
end
