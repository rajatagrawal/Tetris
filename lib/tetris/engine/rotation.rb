module Tetris
  module Engine
    class Rotation

      def initialize(tetris_map)
        @map = tetris_map.map
        @height = tetris_map.height
        @width = tetris_map.width
      end

      def rotate_shape(shape, other_shape)
        shape.rotate if space_to_rotate?(shape, other_shape)
      end

      def space_to_rotate?(shape, other_shape)
        orientation = shape.orientation
        case orientation
        when '0_degrees'
          can_rotate_90_degrees?(shape, other_shape)
        when '90_degrees'
          can_rotate_180_degrees?(shape, other_shape)
        when '180_degrees'
          can_rotate_270_degrees?(shape, other_shape)
        when '270_degrees'
          can_rotate_0_degrees?(shape, other_shape)
        end
      end

      def fits_in_map?(shape, orientation)
        shape.rotated_block_coordinates(orientation).all? do |x, y|
          x_in_bounds = (1..@width).cover?(x)
          y_in_bounds = (1..@height).cover?(y)
          x_in_bounds && y_in_bounds
        end
      end

      def can_rotate_90_degrees?(shape, other_shape)
        if !fits_in_map?(shape, '90_degrees')
          return false
        end
        shape.rotated_block_coordinates('90_degrees').each do |coordinates|
          x, y = coordinates

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end
        true
      end

      def can_rotate_180_degrees?(shape, other_shape)
        if !fits_in_map?(shape, '180_degrees')
          return false
        end
        shape.rotated_block_coordinates('180_degrees').each do |coordinates|
          x,y = coordinates

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end
        true
      end

      def can_rotate_270_degrees?(shape, other_shape)
        if !fits_in_map?(shape, '270_degrees')
          return false
        end
        shape.rotated_block_coordinates('270_degrees').each do |coordinates|
          x,y = coordinates

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end
        true
      end

      def can_rotate_0_degrees?(shape, other_shape)
        if !fits_in_map?(shape, '0_degrees')
          return false
        end

        shape.rotated_block_coordinates('0_degrees').each do |coordinates|
          x,y = coordinates

          if other_shape.block_coordinates.include? [x,y, other_shape.color]
            return false
          end

          if @map[x][y] != 'none'
            return false
          end
        end
        true
      end
    end
  end
end
