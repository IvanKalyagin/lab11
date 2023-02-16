class Palindrome < ApplicationRecord
  include ActiveModel::Serializers::Xml

  validates :input, {
    presence: { message: 'Введена пустая строка' },
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      message: 'Введен символ, отличный от цифры'
    }
  }

  before_create :set_params

  def decode_output
    ActiveSupport::JSON.decode(output)
  end

  private

  def set_params
    @input = self.input.to_i
    self.output = encode_output
  end

  def encode_output
    ActiveSupport::JSON.encode(result)
  end

  def result
    res_arr = [0, '', '']
    (1..@input.to_i).each do |i|
      if palindrome_func?(i ** 2)
        res_arr[0] += 1
        res_arr[1] += ' ' + i.to_s
        res_arr[2] += ' ' + (i ** 2).to_s
      end
    end
    res_arr
  end

  def palindrome_func?(number)
    number.to_s == number.to_s.reverse
  end
end
