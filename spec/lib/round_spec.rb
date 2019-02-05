require "spec_helper"

RSpec.describe Round do
  # Round should accept an array of players and save it to a hands variable
  # Round should initialize a new Deck
  # Ruond should output "Start Round!"
  # Round should initialize an instances of Hand for each player
  # Round should draw 4 cards for each player and put them in the hand
  # Round should report the outcomein the form a of a string

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

  it "should output 'START ROUND!' to the console" do
    expect { round.welcome }.to output("START ROUND!\n").to_stdout
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

  it "should report the outcome of the round as a string" do
    expect(round.outcome).to be_a(String)
    expect(round.outcome).to include("The winning hand is ")

    winning_sum = round.hands.max{ | a, b | a[1][:hand].total_hand <=> b[1][:hand].total_hand }[1][:hand].total_hand.to_s
    expect(round.outcome).to include(winning_sum)
  end
end
