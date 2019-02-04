require "spec_helper"

RSpec.describe Hand do
  # Hand should start empty
  # Hand should have 4 unique instances of Card randomly selected from Deck
  # Hand should be able to give you the total value of the cards in Hand

  hand = Hand.new()

  it "should be an instance of Hand" do
    expect(hand).to be_an_instance_of(Hand)
  end

  it "should draw 4 cards and save them to an array" do
    hand.draw_4(Deck.new)
    expect(hand.cards.count).to eq(4)
  end

  it "should total 4 cards drawn" do
    total = hand.cards.sum {|card| card.card_value }
    expect(hand.total_hand).to eq(total)
  end
end
