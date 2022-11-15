require './spec_helper'

RSpec.describe Generatable do
  
  let (:enigma) {Enigma.new(message)}
  let (:message) {'hello world'}
  let (:key) {enigma.random_key}
  
  describe '#random_key' do
    it 'generates a random 5 digit number' do
      expect(enigma.random_key.length).to eq(5)
    end
  end
  
  describe '#encrypt_date' do
    it 'formats the date for the encryption' do
      expect(enigma.encrypt_date.length).to eq(6)
      expect(enigma.encrypt_date).to be_a(String)
      expect(enigma.encrypt_date).to eq(Date::today.strftime('%d%m%y'))
    end
  end
end