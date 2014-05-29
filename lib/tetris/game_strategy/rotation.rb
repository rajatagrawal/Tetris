module Tetris
  module GameStrategy
    module Rotation

      def rotate_shape
        shape.rotate if space_to_rotate? shape
      end

      def space_to_rotate?(shape)
        orientation = shape.orientation
        case orientation
        when '0_degrees'
          can_rotate_90_degrees? shape
        when '90_degrees'
          can_rotate_180_degrees? shape
        when '180_degrees'
          can_rotate_270_degrees? shape
        when '270_degrees'
          can_rotate_0_degrees? shape
        end
      end

      def fits_in_map?(shape, orientation)
        shape.rotated_block_coordinates(orientation).each do |coordinate|
          x = coordinate[0]
          y = coordinate[1]

          if x < 1 || x > width
            return false
          end

          if y < 1 || y > height
            return false
          end
        end
        return true
      end

      def can_rotate_90_degrees?(shape)
        if !fits_in_map?(shape, '90_degrees')
          return false
        end
        shape.rotated_block_coordinates('90_degrees').each do |coordinates|
          x, y = coordinates

          if tetris_map[x][y][0] == false
            return false
          end
        end
        true
      end

      def can_rotate_180_degrees?(shape)
        if !fits_in_map?(shape, '180_degrees')
          return false
        end
        shape.rotated_block_coordinates('180_degrees').each do |coordinates|
          x,y = coordinates

          if tetris_map[x][y][0] == false
            return false
          end
        end
        true
      end

      def can_rotate_270_degrees?(shape)
        if !fits_in_map?(shape, '270_degrees')
          return false
        end
        shape.rotated_block_coordinates('270_degrees').each do |coordinates|
          x,y = coordinates

          if tetris_map[x][y][0] == false
            return false
          end
        end
        true
      end

      def can_rotate_0_degrees?(shape)
        if !fits_in_map?(shape, '0_degrees')
          return false
        end

        shape.rotated_block_coordinates('0_degrees').each do |coordinates|
          x,y = coordinates[0]

          if tetris_map[x][y][0] == false
            return false
          end
        end
        true
      end
    end
  end
end
