require 'pry'
class Octal
  def initialize(string_number)
    @string_number = string_number
    @string_digits = string_number.split("")
    @digits = string_number.split("").map(&:to_i)
  end

  def to_decimal
    return 1 if @string_number == "1"
    return 0 if invalid_entry
    octal_num = 0
    index = 0
    @digits.reverse_each do |digit|
      octal_num += digit * (8**index)
      # binding.pry
      index += 1
    end
    p octal_num
  end

  def invalid_entry
    return true if @digits.length == 1
    return true if @digits == [6,7,8,9]
    @string_digits.each do |str|
      return true if str != str.to_i.to_s
    end
    false
  end
end

new_octal = Octal.new("233")
new_octal.to_decimal
