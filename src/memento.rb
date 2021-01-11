# Memento


class Board
  # the memento class
  class Snapshot
    attr_reader :saved_grid

    def initialize(source)
      @saved_grid = source.grid.dup
    end
  end

  # the primary class
  attr_reader :grid

  def initialize
    @grid = ['-'] * 9
  end

  def move(x, y, piece)
    @grid[(y * 3) + x] = piece
  end

  def print
    @grid.length.times do |n|
      STDOUT.print @grid[n]
      if (n + 1) % 3 == 0
        puts ''
      end
    end
    puts "\n"
  end

  def snapshot
    Snapshot.new(self)
  end

  def restore_snapshot(snapshot)
    @grid = snapshot.saved_grid
  end
end


#
# demonstration
#

puts 'Initial board'
board = Board.new
board.print
snap1 = board.snapshot

puts 'move 1'
board.move 1, 1, 'X'
board.print
snap2 = board.snapshot

puts 'move 2'
board.move 0, 2, 'O'
board.print
snap3 = board.snapshot

puts 'move 3'
board.move 2, 1, 'Y'
board.print

puts "****\n\n"

puts 'undo move 3'
board.restore_snapshot snap3
board.print

puts 'undo move 2'
board.restore_snapshot snap2
board.print

puts 'undo move 1'
board.restore_snapshot snap1
board.print
