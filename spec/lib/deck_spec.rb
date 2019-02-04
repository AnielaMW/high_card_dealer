require "spec_helper"
require 'pry'

RSpec.describe Deck do
  # Deck should have 52 unique instances of Card
  # Deck should be shuffled
  # Deck should be able to 'deal' cards thus removing them from the front of the array

  deck = Deck.new()

  it "should be an instance of Deck" do
    expect(deck).to be_an_instance_of(Deck)
  end

  it "should build a deck containing all 52 unique combinations of rank and
  suit" do
    expect(deck.cards.count).to eq(52)

    suits = ['♦', '♣', '♠', '♥']
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

    suits.each do | suit |
      ranks.each do | rank |
        expect(deck.cards.select { | card | card.suit == suit && card.rank == rank }.count).to eq(1)
      end
    end
  end

  it "should shuffle the cards so they are not in order" do
    shuffled = deck.cards.map { |e| [e.rank, e.suit] }

    unshuffled = []
    suits = ['♦', '♣', '♠', '♥']
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    suits.each do |suit|
      ranks.each do |rank|
        unshuffled << [rank, suit]
      end
    end

    expect(shuffled).not_to eql(unshuffled)
  end

  it "should deal cards from the front of the array" do
    first_card = deck.cards[0]
    delt_card = deck.deal

    expect(delt_card).to eq(first_card)
    expect(deck.cards.count).to eq(51)
    expect(deck.cards.any? { |card| card.suit == delt_card.suit && card.rank == delt_card.rank }).to be(false)
  end
end
