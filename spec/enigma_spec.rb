require 'spec_helper'

RSpec.describe Enigma do
  
  let (:message) {'hello world'}
  let (:key) {'02715'}
  let (:date) {'040895'}
  let (:enigma) {Enigma.new(message, key, date)}
  let (:enigma_1) {Enigma.new('message')}
  
  describe '#initialize' do
    it 'creates new instance with alphabet + ' ' array' do
      expect(enigma.alphabet).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
      expect(enigma.alphabet.count).to eq(27)
    end
    
    xit 'initializes with empty arrays' do
      expect(enigma.key_array).to eq([])
      expect(enigma.shift_array).to eq([])
      expect(enigma.offset_array).to eq([])
    end
  end
  
  describe '#random_key' do
    it 'generates a random 5 digit number' do
      # require 'pry';binding.pry
      expect(enigma.key).to eq('02715')
      expect(enigma.random_key.length).to eq(5)
      expect(enigma_1.key.length).to eq(5)
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
      expect(enigma.key_split(key)).to eq(['02', '27', '71', '15'])
      expect(enigma.key_split('12345')).to eq(['12', '23', '34', '45'])
    end
  end
  
  describe '#offset' do
    it 'uses the date to determine the alphabet offset' do
      expect(enigma.offset(date)).to eq(['1', '0', '2', '5'])
      expect(enigma.offset('121122')).to eq(['8', '8', '8', '4'])
    end
  end
  
  describe '#shift' do
    it 'determines the total amount to shift the alpabet for encryption' do
      # expect(enigma.shift(key, date)).to eq([3, 27, 73, 20])
      # expect(enigma.shift('12345','121122')).to eq([20, 31, 42, 49]) #shift as array
      
      expect(enigma.shift(key, date)).to eq({:a=>3, :b=>27, :c=>73, :d=>20})
      expect(enigma.shift('12345','121122')).to eq({:a=>20, :b=>31, :c=>42, :d=>49}) #shift as hash
      # binding.pry
    end
  end
  
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
  
  describe '#encrypt' do
    xit 'generates a hash' do
      expect(enigma.encrypt(message, key, date)).to eq({:encryption => 'hello world', :key => '02715', :date => '040895'})
      # binding.pry
      #:encryption is incomplete as the method for encryption isn't written
    end
  end
  
  
  
  # describe '#encrypt' do
  #   it 'will generate a hash and translate a string' do
  #     expect(enigma.encrypt('hello world', '02715', '040895')).to eq({encryption: 'keder ohulw', key: '02715', date: '040895'})
  #   end
  # end
  
  # describe '#decrypt' do
  #   it 'will generate a hash and translate a string' do
  #     expect(enigma.encrypt('keder ohulw', '02715', '040895')).to eq({encryption: 'hello world', key: '02715', date: '040895'})
  #   end
  # end
end
