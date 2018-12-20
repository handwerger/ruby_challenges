class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    digits = @number.to_s.chars.map(&:to_i)
    counter = 1
    result = []
    digits.reverse_each do |num|
      if counter.even?
        if num * 2 < 10 
          result.unshift(num * 2)
        else
          new_num = (num * 2) - 9
          result.unshift(new_num)  
        end
      else
        result.unshift(num)
      end
      counter += 1
    end
    @result = result
  end 

  def checksum
    addends
    @sum = @result.inject(:+)
  end

  def valid?
    checksum
    @sum % 10 == 0
  end

  def self.create(num)
    digits = num.to_s.chars.map(&:to_i)
    addends = get_addends(digits)
    sum = addends.inject(:+) 
    p sum
    if sum % 10 == 0 
      digits << 0 
    else
      missing_amount = 10 - (sum % 10)
      p missing_amount
      digits << missing_amount
    end
    new_number = digits.map(&:to_s).join.to_i
  end

  def self.get_addends(digits)
    
    counter = 1
    result = []
    digits.reverse_each do |num|
      if counter.odd?
        if num * 2 < 10 
          result.unshift(num * 2)
        else
          new_num = (num * 2) - 9
          result.unshift(new_num)  
        end
      else
        result.unshift(num)
      end
      counter += 1
    end
    result
  end

end

