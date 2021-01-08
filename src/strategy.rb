# Strategy

module SumStrategy
  def self.perform(input)
    input.reduce &:+
  end
end

module MeanStrategy
  def self.perform(input)
    input.reduce(&:+).to_f / input.length
  end
end

module DeviationStrategy
  def self.perform(input)
    m = input.reduce(&:+).to_f / input.length

    v = input.
          map { |value| (value - m) ** 2 }.
          reduce(&:+)

    Math.sqrt(v / input.length)
  end
end

# Sample class that is not aware of how its data will be processed
class Dataset
  def initialize(data)
    @data = data
    @strategy = nil
  end

  def strategy=(new_strategy)
    @strategy = new_strategy
  end

  def calculate
    @strategy.perform @data
  end
end

#
# demonstration
#

dataset = Dataset.new([ 4, 5, 1, 5, 7, 4, 3 ])

puts "Running dataset sequences"

[SumStrategy, MeanStrategy, DeviationStrategy].each do |strategy|
  dataset.strategy = strategy
  puts "strategy=#{strategy}"
  puts "  output=#{dataset.calculate}"
end


