require 'spec_helper'

RSpec.describe Enigma do
  let (:enigma) {Enigma.new}
  describe '#encrypt' do
    it 'will generate a hash and translate a string' do
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
    end
  end
  
  describe '#decrypt' do
    it 'will generate a hash and translate a string' do
      expect(enigma.encrypt("keder ohulw", "02715", "040895")).to eq({encryption: "hello world", key: "02715", date: "040895"})
    end
  end
end
