dirname = File.expand_path File.dirname __FILE__
$LOAD_PATH.unshift(dirname) unless $LOAD_PATH.include? dirname

require 'shape/shape_files'
require 'player/player'
require 'constants'
require 'tetris_map'
require 'movement'
require 'rotation'
require 'squeeze'
require 'freeze'
require 'shape_generator'
require 'pry'
