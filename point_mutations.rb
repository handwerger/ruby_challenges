class DNA
  def initialize(orig_strand)
    @orig_strand = orig_strand
  end

  def hamming_distance(test_strand)
    number_of_iterations = shorter_strand_length(test_strand)
    distance = 0
    number_of_iterations.times do |index|
      distance += 1 unless @orig_strand[index] == test_strand[index]
    end
    distance
  end

  def shorter_strand_length(test_strand)
    return @orig_strand.size if @orig_strand.size < test_strand.size
    test_strand.size
  end
end

x = DNA.new("")
x.hamming_distance("")

