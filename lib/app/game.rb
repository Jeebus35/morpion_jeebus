require 'pry'
require_relative 'board'
require_relative  'player'
require_relative 'boardcase'


class Game

  attr_accessor :players, :board

  def initialize
    @players = []
    @board = Board.new
  end

  
  def name_to_save
    puts "Le plus jeune commence, quel est ton blaze ?"
    print "> "
    @players << Player.new(gets.chomp.to_s, "O")

    puts "Joueur 2, le vieillard à toi, quel est ton blaze?"
    print "> "
    @players << Player.new(gets.chomp.to_s, "X")
  end

  # Function that makes play players one by one
  def select_player
     while @board.game_win == false
     @players.map {|item| choose_case(item)}
   end
  end

  # As the case the user wants to play and return symbol into the case in the selected case
  def choose_case (player)
    # If a player win
    if @board.game_win == true
      puts "#{player.name} Remporte la mache quel.le Homme/Femme !"
    # If the game is null
    elsif @board.game_nul == true
      puts "Personne ne gagne, match nul!!"
    # When the game is runing
    else
      puts "#{player.name} à toi de jouer,#{player.symbol} indique une case et appuie sur entrée (A1, A2, A3...,C3)"
      print "> "
      @board.put_symbol(gets.chomp.to_s, player.symbol)
      @board.board_display
      #@board.party_win?
    end
  end

  # Ask if the user want to play an other game
  # !!! This is not working properly because variable keep value from the last game
  def ask_new_game
    puts " Alors on recommence ? Ok, ça marche tape 'oui' et on redémarre. "
    print "> "
    new_game = gets.chomp.to_s

    if new_game == "oui"
      # Put back the array all blank
      @board.array_cases.map! { |item| item.content = " " }
      # call the self perform to play again
      self.perform
    end
  end

  def perform
    name_to_save
    puts "Le nom du joueur 1 est #{@players[0].name} et son symbole est #{@players[0].symbol}"
    puts "Le nom du joueur 2 est #{@players[1].name} et son symbole est #{@players[1].symbol}"
    # Show empty board before playing
    @board.board_display

    select_player
    ask_new_game
  end
end