require 'pry'
require_relative 'boardcase'

class Board
  attr_accessor :array_cases, :choose_case, :game_win, :game_nul

  def initialize

    @A1 = BoardCase.new("A1", " ")
    @A2 = BoardCase.new("A2", " ")
    @A3 = BoardCase.new("A3", " ")
    @B1 = BoardCase.new("B1", " ")
    @B2 = BoardCase.new("B2", " ")
    @B3 = BoardCase.new("B3", " ")
    @C1 = BoardCase.new("C1", " ")
    @C2 = BoardCase.new("C2", " ")
    @C3 = BoardCase.new("C3", " ")

    @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
    @game_win = false
    @game_nul = false

  end

  def board_display

    puts "      | 1 | 2 | 3 |"
    puts "-------------------"
    puts "     A| #{@A1.content} | #{@A2.content} | #{@A3.content} |"
    puts "------------------"
    puts "     B| #{@B1.content} | #{@B2.content} | #{@B3.content} |"
    puts "-------------------"
    puts "     C| #{@C1.content} | #{@C2.content} | #{@C3.content} |"
    puts "      _____________"

  end

  def board_clean
    @A1.content = " " 
    @A2.content = " " 
    @A3.content = " " 
    @B1.content = " " 
    @B2.content = " " 
    @B3.content = " " 
    @C1.content = " " 
    @C2.content = " " 
    @C3.content = " " 
  end  

  def put_symbol (case_choose, player_symbol)
     @array_cases.map { |item| item.position == case_choose ? item.content = player_symbol  : item }
  end

  def party_win?


        if @A1.content = "X" && @A2.content = "X" && @A2.content = "X" || @A1.content = "O" && @A2.content = "O" && @A2.content = "O"
        then @game_win = true
        end 

        if @C1.content = "X" && @C2.content = "X" && @C3.content = "X" || @C1.content = "O" && @C2.content = "O" && @C2.content = "O"
        then @game_win = true
        end

        if @B1.content = "X" && @B2.content = "X" && @B3.content = "X" || @B1.content = "O" && @B2.content = "O" && @B2.content = "O"
        then @game_win = true
        end 

        if @A1.content = "X" && @B1.content = "X" && @C1.content = "X" || @A1.content = "O" && @B1.content = "O" && @C2.content = "O"
        then @game_win = true 
        end

        if @A2.content = "X" && @B2.content = "X" && @C2.content = "X" || @A2.content = "O" && @B2.content = "O" && @C2.content = "O"
        then @game_win = true 
        end

        if @A3.content = "X" && @B3.content = "X" && @C3.content = "X" || @A3.content = "O" && @B3.content = "O" && @C3.content = "O"
        then @game_win = true
        end

        if @A1.content = "X" && @B2.content = "X" && @C3.content = "X" || @A1.content = "O" && @B2.content = "O" && @C3.content = "O"
        then @game_win = true 
        end
        
        if @A3.content = "X" && @B2.content = "X" && @C1.content = "X" || @A3.content = "O" && @B2.content = "O" && @C1.content = "O"
        then @game_win = true
        end

        def game_nul
          @array_cases.each { |item| item.content == /[:SPACE:]/ ? @game_nil_variable = true : @game_nil_variable = false }
        end  
    end

end
