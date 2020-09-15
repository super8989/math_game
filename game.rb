class Game
  attr_accessor :player1, :player2, :turn, :current_player

  def initialize
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')
    @current_player = player2
    start_game
  end

  def start_game
    while player1.lives > 0 && player2.lives > 0
      @current_player = @current_player == player1 ? player2 : player1

      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"

     new_turn
    end
    puts player1.lives == 0 ? "#{@player2.name} won with #{@player2.lives}/3 points" : "#{@player1.name} won with #{@player2.lives}/3 points"
  end

  def new_turn
    turn = Turn.new(@current_player.name)
    turn.ask
    
    if !turn.ask
      @current_player.lives -= 1
      puts "Wrong answer"
    else
      puts "Correct"
      puts "*** New Turn ***"
    end
  end
end