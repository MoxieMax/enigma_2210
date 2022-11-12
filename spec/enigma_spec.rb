require 'spec_helper'

RSpec.describe Enigma do
  let (:enigma) {Enigma.new}
  
  describe '#initialize' do
    it 'creates new instance with alphabet + " " array' do
      expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
      # binding.pry
    end
  end
  
  describe '#random_key' do
    it 'generates a random 5 digit number' do
      expect(enigma.random_key.to_s.length).to eq(5)
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
