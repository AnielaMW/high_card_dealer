require_relative "deck"
require_relative "round"

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def draw_4(deck)
    4.times{ | n | @cards << deck.deal }
  end

  def total_hand
    @cards.sum {|card| card.card_value }
  end
end
