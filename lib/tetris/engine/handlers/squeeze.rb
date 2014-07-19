module Tetris
  module Engine
    module Handlers
      class Squeeze

        attr_reader :no_of_squeezed_rows

        def initialize map
          @map = map
          @no_of_squeezed_rows = 0
        end

        def squeeze_rows
          new_grid = @map.grid.reject(&method(:row_filled?))
          @no_of_squeezed_rows = @map.grid.size - new_grid.size
          new_rows = (1..@no_of_squeezed_rows).map { new_row(@map.width) }
          @map.grid = new_rows + new_grid
        end

        private

        def row_filled?(row)
          row.all? { |column| column != 'none' }
        end

        def new_row width
          Array.new(width, 'none')
        end
      end
    end
  end
end
