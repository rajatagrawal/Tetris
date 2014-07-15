module Tetris
  module Engine
    class Squeeze

      def initialize(tetris_map)
        @map = tetris_map
        @height = tetris_map.height
        @width = tetris_map.width
      end

      def no_of_rows
        rows_to_squeeze.count
      end

      def squeeze_rows
        rows = absolute_row_positions rows_to_squeeze
        rows.cycle(1) { |row| squeeze_row row }
      end

      private

      def row_filled?(h)
        (1..@width).all? { |w| @map[w,h] != 'none' }
      end

      def rows_to_squeeze
        rows = (1..@height).select { |row| row_filled? row  }
      end

      def absolute_row_positions(rows)
        rows.reverse.map.with_index {|r,i| r + i }
      end

      def squeeze_row(row)
        row.downto(2) { |r| copy_row(r, r-1) }
        @map[nil, 1] = new_row
      end

      def copy_row(r1, r2)
        (1..@width).cycle(1) { |w| @map[w,r1] = @map[w, r2] }
      end

      def new_row
        Array.new(@width, 'none')
      end
    end
  end
end
