require 'bundler'
Bundler.require 
 


require_relative 'lib/app/game'
require_relative 'lib/app/player'
require_relative 'lib/app/board'
require_relative 'lib/app/boardcase'
require_relative 'lib/view/show'

Game.new.perform