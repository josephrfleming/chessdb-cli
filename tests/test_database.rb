# tests/test_database.rb
require 'minitest/autorun'
require_relative '../database'

class TestDatabase < Minitest::Test
  def setup
    @game = Database.new
  end

  def test_player_names
    @game.stub :gets, "WhitePlayer\n" do
      @game.player_names
      assert_equal "WhitePlayer", @game.white_lastname
    end

    @game.stub :gets, "BlackPlayer\n" do
      @game.player_names
      assert_equal "BlackPlayer", @game.black_lastname
    end
  end

  def test_moves
    moves_input = [
      "e4\n", "e5\n", "Nf3\n", "Nc6\n", "done\n"
    ]
    
    @game.stub :gets, proc { moves_input.shift } do
      @game.moves
      assert_equal ["e4", "e5", "Nf3", "Nc6"], @game.notation
    end
  end

  def test_get_winner
    @game.stub :gets, "White\n" do
      @game.get_winner
      assert_equal "White", @game.winner
    end
  end

  def test_game_data
    @game.white_lastname = "WhitePlayer"
    @game.black_lastname = "BlackPlayer"
    @game.winner = "White"
    @game.notation = ["e4", "e5", "Nf3", "Nc6"]
    
    expected_output = <<~OUTPUT
      White: WhitePlayer
      Black: BlackPlayer
      Winner: White
      Moves: e4, e5, Nf3, Nc6
    OUTPUT
    
    assert_output(expected_output) do
      @game.game_data
    end
  end
end
