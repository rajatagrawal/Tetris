require 'spec_helper'
require 'handlers/rotation'
require 'player/player'

module Tetris
  module Engine
    module Handlers
      describe Rotation do
        describe '#rotate_shape' do
          it 'rotates a player\'s shape if all space calculations are satisified' do
            allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
              and_return(true)
            allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
              and_return(true)
            allow_any_instance_of(Calculations::Coordinates).to receive(:rotated_xy_for)
            allow_any_instance_of(Calculations::Coordinates).to receive(:other_shape_xy)

            player = double(:player, shape: double)
            rotation = Rotation.new(double, [player])
            expect(player.shape).to receive(:rotate)
            rotation.rotate_shape(player)
          end

          it 'does not rotates a player\'s shape if any of space calculations are not satisified' do
            allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
              and_return(true)
            allow_any_instance_of(Calculations::Coordinates).to receive(:rotated_xy_for)
            allow_any_instance_of(Calculations::Coordinates).to receive(:other_shape_xy)

            player = double(:player, shape: double)
            rotation = Rotation.new(double, [player])
            expect(player.shape).to_not receive(:rotate)
            rotation.rotate_shape(player)
          end
        end
      end
    end
  end
end
