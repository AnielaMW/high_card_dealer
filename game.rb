require 'pry'

# Note: we only need `require_relative` if we end up calling a class by name in our file's logic. As such, you may have to add more `require_relative` statements accordingly.
require_relative "lib/war"

#GAME START
game = War.new()
game.begin_game

# Your game logic here.
