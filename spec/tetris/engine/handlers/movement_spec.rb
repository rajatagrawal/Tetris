require 'tetris/engine/handlers/movement'
require 'tetris/engine/player/player'

module Tetris
  module Engine
    module Handlers
      describe Movement do
        describe '#move_shape' do
          it 'moves a player\'s shape if all space calculations are satisified' do
            allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
              and_return(true)
            allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
              and_return(true)
            allow_any_instance_of(Calculations::Coordinates).to receive(:coordinates_for)
            allow_any_instance_of(Calculations::Coordinates).to receive(:other_shape_coordinates)

            player = double(:player, shape: double)
            movement = Movement.new(double, [player])
            expect(player.shape).to receive(:move).with('down')
            movement.move_shape(player, 'down')
          end

          it 'does not moves a player\'s shape if any of space calculations are not satisified' do
            allow_any_instance_of(Calculations::Space).to receive(:coordinates_in_bounds?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:collides_with_other_shape?).
              and_return(false)
            allow_any_instance_of(Calculations::Space).to receive(:space_in_map?).
              and_return(true)
            allow_any_instance_of(Calculations::Coordinates).to receive(:coordinates_for)
            allow_any_instance_of(Calculations::Coordinates).to receive(:other_shape_coordinates)

            player = double(:player, shape: double)
            movement = Movement.new(double, [player])
            expect(player.shape).to_not receive(:move).with('down')
            movement.move_shape(player, 'down')
          end
        end
      end
    end
  end
end
