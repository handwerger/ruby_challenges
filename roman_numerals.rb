class Integer

  def to_roman
    roman_numeral = ""
    digits = self.to_s.chars.map(&:to_i)
    ones_place = digits[-1]
    tens_place = digits[-2]
    hundreds_place = digits[-3]
    thousands_place = digits[-4]
    roman_numeral.prepend(roman_ones_place(ones_place))
    roman_numeral.prepend(roman_tens_place(tens_place))
    roman_numeral.prepend(roman_hundreds_place(hundreds_place))
    roman_numeral.prepend(roman_thousands_place(thousands_place))
    p roman_numeral
  end

  def roman_ones_place(number)
    case number
     when 1 then "I"
     when 2 then "II"
     when 3 then "III"
     when 4 then "IV"
     when 5 then "V"
     when 6 then "VI"
     when 7 then "VII"
     when 8 then "VIII"
     when 9 then "IX"
     when 0 then ""
    end
  end

  def roman_tens_place(number)
    case number
      when 1 then "X"
      when 2 then "XX"
      when 3 then "XXX"
      when 4 then "XL"
      when 5 then "L"
      when 6 then "LX"
      when 7 then "LXX"
      when 8 then "LXXX"
      when 9 then "XC"
      when 0 then ""
      when nil then ""
    end
  end

  def roman_hundreds_place(number)
    case number
      when 1 then "C"
      when 2 then "CC"
      when 3 then "CCC"
      when 4 then "CD"
      when 5 then "D"
      when 6 then "DC"
      when 7 then "DCC"
      when 8 then "DCCC"
      when 9 then "CM"
      when 0 then ""
      when nil then ""
    end
  end

  def roman_thousands_place(number)
    case number
      when 1 then "M"
      when 2 then "MM"
      when 3 then "MMM"
      when nil then ""
    end
  end
end
