module Tetris
  module Engine
    class Squeeze

      def initialize(tetris_map)
        @map = tetris_map
        @height = tetris_map.height
        @width = tetris_map.width
      end

      def rows_to_squeeze
        squeeze_row = (1..@height).to_a
        (1..@height).each do |row|
          (1..@width).each do |col|
            if @map[col, row] == 'none'
              squeeze_row.delete(row)
              break
            end
          end
        end
        squeeze_row.sort
      end


      def squeeze_rows(rows)
        rows.each do |row|
          squeeze_row row
        end
      end

      private

      def squeeze_row(row)
        row.downto(2) do |r|
          (1..@width).each do |w|
            @map[w, r] = @map[w, r-1]
          end
        end

        (1..@width).each do |w|
          @map[w, 1] = 'none'
        end
      end
    end
  end
end
