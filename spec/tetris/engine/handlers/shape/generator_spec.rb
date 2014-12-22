require 'spec_helper'
require 'handlers/shape/generator'
require 'player/player'
require 'shape/complex_shape'

module Tetris
  module Engine
    module Handlers
      module Shape
        describe Generator do
          describe '#generate_shape' do
            let(:width) { 4 }
            let(:unit_side) { 35 }
            before do
              Player.class_variable_set :@@next_number, 0
            end

            it 'generates shape for a player with player config' do
              player = Player.new
              shape = Generator.generate_shape(player, width , unit_side)
              expect(shape).to be_kind_of(ComplexShape)
              expect(shape.x).to eq 2
              expect(shape.y).to eq 1
              expect(shape.color).to eq player.color
              expect(shape.unit_side).to eq 35
            end

            it 'positions the x for shape equally for all the players' do
              player1 = Player.new
              player2 = Player.new
              expect(player1.number).to eq 1
              expect(player2.number).to eq 2
              shape = Generator.generate_shape(player1, width , unit_side)
              expect(shape.x).to eq 1
              shape = Generator.generate_shape(player2, width , unit_side)
              expect(shape.x).to eq 3
            end
          end
        end
      end
    end
  end
end
