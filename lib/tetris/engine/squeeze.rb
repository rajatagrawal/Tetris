module Tetris
  module Engine
    class Squeeze
      def self.squeeze_rows map
        new_grid = map.grid.reject(&method(:row_filled?))
        num_squeezed = map.grid.size - new_grid.size
        new_rows = (1..num_squeezed).map { new_row(map.width) }
        map.grid = new_rows + new_grid
        num_squeezed
      end

      def self.row_filled?(row)
        row.all? { |column| column != 'none' }
      end

      def self.new_row width
        Array.new(width, 'none')
      end
    end
  end
end
