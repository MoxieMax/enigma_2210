require 'spec_helper'

RSpec.describe Enigma do
  
  let (:enigma) {Enigma.new('hello world', '02715', '040895')}
  let (:message) {enigma.message}
  let (:key) {enigma.key}
  let (:date) {enigma.date}
  let (:enigma_1) {Enigma.new('message', key_1)}
  let (:key_1) {'12121'}
  let (:date_1) {'141122'}
  
  describe '#initialize' do
    it 'creates new instance with alphabet + ' ' array' do
      expect(enigma.alphabet).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
      expect(enigma.alphabet.count).to eq(27)
      expect(enigma.shifts).to be_a(Hash)
      expect(enigma.shifts.keys).to eq([:a, :b, :c, :d])
      expect(enigma.shifts.values[0]).to be_an(Integer)
    end
  end
  
  # describe '#random_key' do
  #   it 'generates a random 5 digit number' do
  #     expect(enigma.key).to eq('02715')
  #     expect(enigma.random_key.length).to eq(5)
  #     expect(enigma_1.key.length).to eq(5)
  #   end
  # end
  
  # describe '#encrypt_date' do
  #   it 'formats the date for the encryption' do
  #     expect(enigma.encrypt_date.length).to eq(6)
  #     expect(enigma.encrypt_date).to be_a(String)
  #   end
  # end
  
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
    it 'determines the total amount to shift the alphabet for encryption' do
      expect(enigma.shift(key, date)).to eq({:a=>3, :b=>27, :c=>73, :d=>20})
      expect(enigma.shift('12345','121122')).to eq({:a=>20, :b=>31, :c=>42, :d=>49})
    end
  end
  
  # describe '#cipher' do
  #   it 'encodes a string based on the given key' do
  #     expect(enigma.cipher('h', 3)).to eq('k')
  #     expect(enigma.cipher('e', 27)).to eq('e')
  #     expect(enigma.cipher('l', 73)).to eq('d')
  #     expect(enigma.cipher('l', 20)).to eq('e')
  #     expect(enigma.cipher('o', 3)).to eq('r')
  #     expect(enigma.cipher('hello', 3)).to eq('khoor')
  #   end
  # end
  # 
  # describe '#encode' do
  #   it 'encodes each letter in a string using #cipher' do
  #     expect(enigma.encode(message)).to eq('keder ohulw')
  #   end
  # end
  
  describe '#encrypt' do
    it 'generates a hash' do
      expect(enigma.encrypt(message, key, date)).to eq({:encryption => 'keder ohulw', :key => '02715', :date => '040895'})
      expect(enigma_1.encrypt(enigma.message, key_1, date_1)).to eq({:encryption => 'agejhbpmknx', :key => '12121', :date => '141122'})
    end
  end
  
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

  describe '#decrypt' do
    it 'will generate a hash and translate a string' do
      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq({decryption: 'hello world', key: '02715', date: '040895'})
      
      expect(enigma_1.decrypt('agejhbpmknx', key_1, date_1)).to eq({decryption: 'hello world', key: '12121', date: '141122'})
      
      enigma_2 = Enigma.new('hello world', '02715')
      encrypted = enigma_2.encrypt('hello world', '02715')
      
      expect(enigma_2.decrypt(encrypted[:encryption], '02715')).to eq({decryption: 'hello world', key: '02715', date: (enigma_2.date)})
    end
  end
end
