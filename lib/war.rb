require_relative "round"

class War
  attr_accessor :players, :rounds

  def initialize
    @players = {}
    @rounds = []
  end

  def begin_game
    welcome
    player_name(play_computer)
    create_round
  end

  def welcome
    puts "GAME START!"
  end

  def play_computer
    print "Play against the computer? (Y/N) "
    answer = gets.chomp.downcase
    ["y", "n"].include?(answer) ? answer : play_computer ;
  end

  def player_name(answer)
    case answer
    when "y"
      @players[:"player1"] = {"name": ask_name(1)}
      @players[:"player2"] = {"name": "The Computer"}
    when "n"
      (1..2).each { |num| @players[:"player#{num}"] = {"name": ask_name(num)}}
    end
  end

  def ask_name(player)
    print "What is Player#{player}'s name? "
    name = gets.chomp
    name
  end

  def create_round
    @rounds << Round.new(@players)
    @rounds[-1].start_round
    create_round if play_another_round == "y"
  end

  def play_another_round
    print "Play another round? (Y/N) "
    answer = gets.chomp.downcase
    ["y", "n"].include?(answer) ? answer : play_round ;
  end
end
