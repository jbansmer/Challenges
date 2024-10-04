class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    shorter = [strand.length, other_strand.length].min
    difference = 0
    shorter.times do |idx|
      difference += 1 unless strand[idx] == other_strand[idx]
    end
    difference
  end

  private

  attr_reader :strand
end
