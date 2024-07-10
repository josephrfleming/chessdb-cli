# app.rb
require_relative 'database'

games = []

def menu
  puts "Welcome to the chess database."
  puts "1) Enter a new game"
  puts "2) View an existing game"
  puts "3) Exit"
  print "Choose an option (1-3): "
end

loop do
  menu
  choice = gets.chomp.to_i

  if choice == 1
    game = Database.new
    game.player_names # Ask for player names
    game.moves # Input moves
    game.get_winner # Get winner information
    games << game

  elsif choice == 2
    if games.empty?
      puts "No games exist in database yet."
    else
      games.each_with_index do |game, index|
        puts "Game #{index + 1}: White: #{game.white_lastname} vs Black: #{game.black_lastname}"
      end

      print "Enter the number corresponding to the game that you would like to view: "
      game_index = gets.chomp.to_i - 1

      if game_index >= 0 && game_index < games.length
        puts "Moves for Game ##{game_index + 1}:"
        games[game_index].notation.each do |move|
          puts move
        end
        puts "Winner: #{games[game_index].winner}" # Display the winner
      else
        puts "Game does not exist."
      end
    end

  elsif choice == 3
    puts "Closing..."
    break
  else
    puts "Enter a valid choice (1, 2, 3)"
  end
end
