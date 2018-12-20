# test first letter of word begins with vowel go to method to add ay and that is result
# else:
# itterate through letters as the ones that are consenants get added to the end of the word then ay
# qu must also need to be moved
# squ must be moved
# x followed by consenant does not get moved
require 'pry'
class PigLatin

  def self.translate(word)
    if word.include?(" ")
      phrase(word)
    else
      if word[0].match(/[aeiou]/)
        add_ay(word)
      elsif word[0..1].match(/(x|y)[^aeiou]/)
        add_ay(word)     
      elsif word[0..1].match(/qu/)
        case_qu(word)
      elsif word[0..2].match(/[^aeiou]qu/)
        case_qu(word)     
      else
        begins_with_consenant(word)
      end
    end
  end

  def self.phrase(word)
    words = word.split(" ")
    words.map! { |word| PigLatin.translate(word) }
    words.join(" ")
  end

  def self.case_qu(word)
    letters = word.chars
    word[0..2].match(/[^aeiou]qu/) ? popped_letters = letters.shift(3) : popped_letters = letters.shift(2)
    letters << popped_letters
    new_word = letters.flatten.join
    add_ay(new_word)
  end

  def self.begins_with_consenant(word)
    letters = word.chars
    popped_letters = ""

    letters.size.times do |letter|
      #binding.pry
      if letters[0].match(/[aeoiu]/)
        break
      else 
        popped_letters << letters.shift
      end
    end
    letters << popped_letters
    add_ay(letters.join)
  end

  def self.add_ay(word)
    word << "ay"
  end

end


PigLatin.translate('quick fast run')