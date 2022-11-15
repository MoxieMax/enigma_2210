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
  
  describe '#encrypt' do
    it 'generates a hash' do
      expect(enigma.encrypt(message, key, date)).to eq({:encryption => 'keder ohulw', :key => '02715', :date => '040895'})
      expect(enigma_1.encrypt(enigma.message, key_1, date_1)).to eq({:encryption => 'agejhbpmknx', :key => '12121', :date => '141122'})
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
