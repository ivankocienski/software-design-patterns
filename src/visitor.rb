# Visitor

class StockHistory
  def data
    { 
      data: 'This is data',
      payload: [ 1, 2, 3, 4, 5 ]
    }
  end
end

class Model
  def initialize(data_source)
    @data_source = data_source
  end

  def process
    raise 'virtual process method called'
  end
end

class AlphaModel < Model
  def process
    payload = @data_source.data[:payload]
    min = payload.min
    max = payload.max
    puts "alpha: min=#{min}, max=#{max}"
  end
end

class BetaModel < Model
  def process
    sum = @data_source.data[:payload].reduce(&:+)
    puts "beta: sum=#{sum}"
  end
end

#
# demonstration
#

# only one source
history = StockHistory.new

# one model
a_model = AlphaModel.new(history)
a_model.process

# a different model
b_model = BetaModel.new(history)
b_model.process
