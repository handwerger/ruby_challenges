require 'pry'
class Trinary
  def initialize(number)
    @string_numbers = number.chars
  end

  def to_decimal
    return 0 if invalid_entry?
    return 1 if @string_numbers == ["1"]
    @digits = @string_numbers.map(&:to_i)
    index = 0
    sum = 0
    @digits.reverse_each do |digit|
      sum += digit * (3**index)
      index +=1
      #binding.pry
    end
    sum
  end

  def invalid_entry?
    @string_numbers.each { |digit| return true unless (digit == "0" || digit == "1" || digit == "2") }
    false
  end   
end
# new_num = Trinary.new('1')
# p new_num.to_decimal
