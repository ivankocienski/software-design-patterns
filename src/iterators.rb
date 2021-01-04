# Iterators

class ArrayIterator
  def initialize(collection)
    @collection = collection
    @position = 0
  end

  def is_done?
    @position >= @collection.length
  end

  def next
    return if is_done?
    @position += 1
  end

  def value
    return if is_done?
    @collection[@position]
  end
end


iterator = ArrayIterator.new([0, 1, 2, 3, 4])

while not iterator.is_done? do
  puts iterator.value
  iterator.next
end

