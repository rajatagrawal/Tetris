require 'spec_helper'
require 'handlers/movement'
require 'player/player'

module Tetris
  module Engine
    module Handlers
      describe Movement do
        describe '#move_shape' do
          describe 'when all the space calculations are satisfied' do
            let(:player) { double(:player, shape: double) }
            let(:movement) { Movement.new(double, [player]) }

            before do
              allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
                and_return(true)
              allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
                and_return(false)
              allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
                and_return(true)
              allow_any_instance_of(Calculations::Coordinates).to receive(:xy_for)
              allow_any_instance_of(Calculations::Coordinates).to receive(:other_shapes_xy)
            end

            it 'moves the player\'s shape' do
              expect(player.shape).to receive(:move).with('down')
              movement.move_shape(player, 'down')
            end

            it 'returns true' do
              allow(player.shape).to receive(:move).with('down')
              expect(movement.move_shape(player, 'down')).to eq true
            end
          end

          describe 'when all the space calculations are not satisfied' do
            let(:player) { double(:player, shape: double) }
            let(:movement) { Movement.new(double, [player]) }

            before do
              allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
                and_return(false)
              allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
                and_return(false)
              allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
                and_return(true)
              allow_any_instance_of(Calculations::Coordinates).to receive(:xy_for)
              allow_any_instance_of(Calculations::Coordinates).to receive(:other_shapes_xy)
            end

            it 'does not moves the player\'s shape' do
              expect(player.shape).to_not receive(:move).with('down')
              movement.move_shape(player, 'down')
            end

            it 'returns false' do
              expect(player.shape).to_not receive(:move).with('down')
              expect(movement.move_shape(player, 'down')).to eq false
            end
          end
        end

        describe '#drop_shape' do
          it 'moves the shape down until the calculations are satisfied' do
            allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
              and_return(true, true, false)
            allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
              and_return(true)
            allow_any_instance_of(Calculations::Coordinates).to receive(:xy_for)
            allow_any_instance_of(Calculations::Coordinates).to receive(:other_shapes_xy)

            player = double(:player, shape: double)
            movement = Movement.new(double, [player])
            expect(player.shape).to receive(:move).with('down').twice
            movement.drop_shape(player)
          end
        end
      end
    end
  end
end
