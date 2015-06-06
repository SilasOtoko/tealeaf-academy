# Two approaches to OOP
# 1. Extract classes and objects from existing code
# 2. Write out a description of the program. Extract nouns from the
# description, and group common verbs into nouns.

# What is a Tic Tac Toe game?
 # Two player game. Start with an empty 3 by 3 board. One player is 'X',
 # the other player is 'O'. Two players alternate marking empty squares
 # until one player has 3 of his marks in a row. If all squares are
 # marked and nobody won, it's a tie.

class Board
  attr_accessor :board

  def initialize
    self.board = {}
    (1..9).each { |position| self.board[position]}
  end

  def draw
    system 'cls'
    puts " #{board[1]} | #{board[2]} | #{board[3]}"
    puts "----------"
    puts " #{board[4]} | #{board[5]} | #{board[6]}"
    puts "----------"
    puts " #{board[7]} | #{board[8]} | #{board[9]}"
  end

  def empty_squares
    board.select { |position, piece| piece == ' '}.keys
  end

  def square(position)
    @board[position]
  end

  def square=(position, piece)
    @board[position] = piece
  end
end

class Square
  def initialize(value)
    @value = value
  end
end

class Player

end

class Human < Player
end

class Computer < Player
end


board = Board.new
board.draw


# player
#   - name
#   - marker

# square
#   - occupied?
#   - mark(marker)

# game engine
   # draw a board
    #
    # assign player to 'x'
    # assign computer to 'o'
    #
    # loop until a winner or all squares are taken
    #   player picks an empty square
    #   check for a winner
    #   computer picks an empty square
    #   check for a winner
    # end
    #
    # if there's a winner
    #   show the winner
    # or else
    #   it's a tie