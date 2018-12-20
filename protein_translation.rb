class Translation
  def self.of_rna(rna)
    codons = rna.chars.each_slice(3).map(&:join)
    translation = []
    codons.each do |strand| 
      break if self.of_codon(strand) == "STOP"
      translation << self.of_codon(strand) 
    end
    translation
  end

  def self.of_codon(codon)
    case codon
      when 'AUG' then "Methionine"
      when 'UUU','UUC' then "Phenylalanine"
      when 'UUA', 'UUG' then "Leucine"
      when 'UCU','UCC', 'UCA', 'UCG' then "Serine"
      when 'UAU', 'UAC' then "Tyrosine"
      when 'UGU', 'UGC' then "Cysteine"
      when 'UGG' then "Tryptophan"
      when 'UAA', 'UAG', 'UGA' then 'STOP'
      else raise InvalidCodonError
    end
  end

end

class InvalidCodonError < StandardError
end

