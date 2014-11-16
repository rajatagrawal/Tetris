module Tetris
  module Engine
    module Calculations
      class Coordinates
        def xy_for(shape, direction)
          case direction
          when 'right'
            shape.coordinates.map { |x,y| [x+1,y]}
          when 'left'
            shape.coordinates.map { |x,y| [x-1,y]}
          when 'down'
            shape.coordinates.map { |x,y| [x,y+1]}
          when 'up'
            shape.coordinates.map { |x,y| [x,y-1]}
          end
        end

        def other_shapes_xy(shape, shapes)
          shapes.reject { |s| s == shape }.map(&:coordinates)
        end

        def rotated_xy_for(shape)
          shape.coordinates_for(shape.next_orientation)
        end
      end
    end
  end
end
