require 'spec_helper'
require 'handlers/shape/shape'
require 'player/player'

module Tetris
  module Engine
    module Handlers
      module Shape
        describe Shape do

          describe '#new_shape' do
            context 'when the shape is nil' do
              let(:player) { Player.new }
              let(:shape_handler) { Shape.new(1,1) }

              before do
                player.shape = nil
              end

              it 'generates shape for the player if its shape is nil' do
                shape_handler.new_shape(player)
                expect(player.shape).to be_kind_of ComplexShape
              end

              it 'generates the proper config for the shape' do
                expect(Handlers::Shape::Generator).to receive(:generate_shape).
                  with(player, 1, 1).twice
                shape_handler.new_shape(player)
              end

              it 'generates the next shape for the player' do
                expect(player.next_shape).to eq nil
                shape_handler.new_shape(player)
                expect(player.next_shape).to be_kind_of ComplexShape
              end
            end

            context 'if shape is not nil' do
              let(:player) { Player.new }
              let(:shape) { I_Shape.new }
              let(:shape_handler) { Shape.new(1,1) }
              before do
                player.next_shape = shape
                player.shape = double
              end

              it 'assigns the next shape and makes a new next shape' do
                shape_handler.new_shape(player)
                expect(player.shape).to eq shape
                expect(player.next_shape).to be_kind_of(ComplexShape)
                expect(player.next_shape).to_not eq shape
              end

              it 'generates the proper config for the shape' do
                expect(Handlers::Shape::Generator).to receive(:generate_shape).
                  with(player, 1, 1)
                shape_handler.new_shape(player)
              end
            end
          end
        end
      end
    end
  end
end
