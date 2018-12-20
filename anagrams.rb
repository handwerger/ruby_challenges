class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(possible_matches)
    solution = []
    #iterate through possible possible_matches
    possible_matches.each do |possible_match|
      next if possible_match.size != @word.size
      next if possible_match.downcase == @word
      solution << possible_match if calc_match(possible_match)
    end
    p solution
  end

  def calc_match(possible_match)
    possible_match.chars.each do |letter|
        return false unless possible_match.downcase.count(letter.downcase) == @word.count(letter.downcase)
    end
    true
  end
end

corn = Anagram.new("corn")
corn.match(["norc", "dark"])





#iterate through letters of possibe match
    #count number of appearences of letter and see if matches in word
    #if not next else continue if no return false then add to solution