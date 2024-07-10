# database.rb
class Database
  require "date"
  
  attr_accessor :white_lastname, :black_lastname, :winner, :notation

  def initialize
    @notation = []
  end

  def player_names
    print "The last name of the white player: "
    @white_lastname = gets.chomp
    print "The last name of the black player: "
    @black_lastname = gets.chomp
  end
  
  def moves
    puts "Enter the moves in algebraic notation. Type 'done' when you have completed the input."
    # Example valid algebraic notation
    puts "An example game:  1 Nf3 Nf6 2 c4 g6 3 Nc3 Bg7 4 d4 O-O 5 Bf4 d5 6 Qb3 dxc4 7 Qxc4 c6 8 e4 Nbd7 9 Rd1 Nb6 10 Qc5 Bg4 11 Bg5 Na4 12 Qa3 Nxc3 13 bxc3 Nxe4 14 Bxe7 Qb6 15 Bc4 Nxc3 16 Bc5 Rfe8+ 17 Kf1 Be6 18 Bxb6 Bxc4+ 19 Kg1 Ne2+ 20 Kf1 Nxd4+ 21 Kg1 Ne2+ 22 Kf1 Nc3+ 23 Kg1 axb6 24 Qb4 Ra4 25 Qxb6"

    turn = 1

    loop do
      # Odd if white's turn even if black's turn
      if turn.odd?
        print "White's move #{(turn + 1) / 2}: "
      else
        print "Black's move #{turn / 2}: "
      end

      move = gets.chomp
      
      break if move.downcase == 'done'

      @notation << move
      turn += 1
    end
  end
  
  def get_winner
    print "Did white or black win? Enter 'White' or 'Black': "
    @winner = gets.chomp
  end

  def game_data
    puts "White: #{@white_lastname}"
    puts "Black: #{@black_lastname}"
    puts "Winner: #{@winner}"
    puts "Moves: #{notation.join(', ')}"
  end
end
