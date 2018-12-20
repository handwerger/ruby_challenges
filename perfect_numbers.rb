class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    divisors = find_divisors(number)
    sum_of_divisors = divisors.inject(:+)
    determine_classification(number, sum_of_divisors)
  end

  def self.find_divisors(number)
    divisors = []
    1.upto(number / 2) do |test_number|
      divisors << test_number if number % test_number == 0
    end
    divisors
  end

  def self.determine_classification(number, sum_of_divisors)
    return 'deficient' if sum_of_divisors < number
    return 'abundant' if sum_of_divisors > number
    'perfect' 
  end
end

#negative = PerfectNumber.new(-9)

