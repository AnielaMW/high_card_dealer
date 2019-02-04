# require "spec_helper"
#
# RSpec.describe War do
#   # War should have 2 players
#   # War should print output 'Game Start!'
#   # War should ask if you are playing the computer or two people
#   # War should ask for one or both Players names
#   # War should build a round
#   # War should hold an array of rounds
#
#   war = War.new()
#
#   it "should be an instance of War" do
#     expect(war).to be_an_instance_of(War)
#   end
#
#   it "should output 'GAME START!' to the console" do
#     expect { war.welcome }.to output("GAME START!\n").to_stdout
#   end
#
#   it "should ask if you would like to play the computer" do
#     expect { war.play_computer }.to output("Play against the computer? (Y/N) ").to_stdout
#   end
#
#   it "should ask a players name" do
#     expect { war.ask_name(1) }.to output("What is Player1's name? ").to_stdout
#   end
#
#   it "should have 2 players" do
#     war.begin_game
#     expect(war.players.count).to eq(2)
#   end
# end
