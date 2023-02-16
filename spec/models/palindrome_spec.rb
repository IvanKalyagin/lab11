require 'rails_helper'

RSpec.describe Palindrome, type: :model do
  describe 'If adding with similar params' do
    before do
      Palindrome.create!(input: 23) if Palindrome.find_by(input: 23).nil?
    end
    it 'should return error if value isn`t unique' do
      expect { Palindrome.create!(input: 23) }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    context 'should return correct result' do
      before do
        Palindrome.delete_by(input: 18)
      end
      it 'when input 18' do
        expect(Palindrome.create!(input: 18).decode_output).to eq([4, " 1 2 3 11", " 1 4 9 121"])
      end
    end

    context 'check existance' do
      it 'exists in database' do
        expect(Palindrome.find_by(input: 23).nil?).to eq(false)
      end
    end
  end
end
