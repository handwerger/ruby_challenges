class Phrase
  def initialize(phrase)
    @phrase = phrase.split(/[\s,]/).map(&:downcase).each { |word| word.gsub!(/[^a-zA-Z0-9']/, "") }.join(" ")
  end

  def word_count
    answer = Hash.new(0)
    @phrase.split(" ").each do |word|
      word.gsub!(/^'|'$/, "")
      answer[word] += 1
    end
    p answer
  end
end

phrase = Phrase.new("hello!! hello hello? how are you")
phrase.word_count

