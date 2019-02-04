require "spec_helper"

RSpec.describe Card do
  # Card should have a rank and a suit
  # Acceptable suits are ['♦', '♣', '♠', '♥']
  # Acceptable ranks are [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  # Card values are [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  it "should be an instance of Card" do
    card = Card.new(5, '♦')
    expect(card).to be_an_instance_of(Card)
  end

  it "should have a value associated with it's rank" do
    card8 = Card.new(8, '♦')
    cardJ = Card.new('J', '♣')
    cardQ = Card.new('Q', '♠')
    cardK = Card.new('K', '♥')
    cardA = Card.new('A', '♥')

    expect(card8.card_value).to eq(8)
    expect(cardJ.card_value).to eq(11)
    expect(cardQ.card_value).to eq(12)
    expect(cardK.card_value).to eq(13)
    expect(cardA.card_value).to eq(14)
  end

end
