require 'pry'
require_relative "hand"

class Round
  attr_reader :hands, :deck, :winner, :loser

  def initialize(players)
    @deck = Deck.new()
    @hands = players
    @winner = ""
    @loser = ""
  end

  def start_round
    welcome
    create_hand
    draw_cards
    puts outcome
  end

  def welcome
    puts "START ROUND!"
  end

  def create_hand
    @hands.each { | hand | hand[1][:"hand"] = Hand.new() }
  end

  def draw_cards
    @hands.each{ | hand | hand[1][:hand].draw_4(@deck) }
  end

  def outcome
    @winner = @hands.max{ | a, b | a[1][:hand].total_hand <=> b[1][:hand].total_hand }
    @loser = @hands.min{ | a, b | a[1][:hand].total_hand <=> b[1][:hand].total_hand }

    "The winning hand is #{show_hand(@winner)} total #{@winner[1][:hand].total_hand} which belongs to #{@winner[1][:name]}.\n Against #{show_hand(@loser)} total #{@loser[1][:hand].total_hand} which belongs to #{@loser[1][:name]}."
  end

  def show_hand(hand)
    hand[1][:hand].cards.map { | card | card.rank.to_s + card.suit }.join(', ')
  end
end
