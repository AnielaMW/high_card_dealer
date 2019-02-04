require "spec_helper"

RSpec.describe Round do
  # Round should accept an array of players and save it to a hands variable
  # Round should initialize a new Deck
  # Round should initialize an instances of Hand for each player
  # Round should draw 4 cards for each player and put them in the hand

  players = {player1: {"name": "yo"}, player2: {"name": "lo"}}
  round = Round.new(players)

  it "should be an instance of Round" do
    expect(round).to be_an_instance_of(Round)
  end

  it "should accept players and save them to hands" do
    expect(round.hands).to eq(players)
  end

  it "should initialize a new Deck" do
    expect(round.deck).to be_an_instance_of(Deck)
  end

  it "should initialize a Hand for each of two players" do
    round.create_hand
    round.hands.each do |player|
      expect(player[1][:hand]).to be_an_instance_of(Hand)
    end
  end

  it "should draw for cards for the players hand" do
    round.draw_cards
    round.hands.each do |player|
      expect(player[1][:hand].cards.count).to eq(4)
    end
  end
end
