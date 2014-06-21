module Tetris
  module Engine
    module Squeeze
      def rows_to_squeeze
        squeeze_row = (1..@height).to_a
        (1..@height).each do |row|
          (1..@width).each do |col|
            if @map[col][row][0] == true
              squeeze_row.delete(row)
              break
            end
          end
        end
        squeeze_row.sort
      end

      def squeeze_row(row)
        row.downto(2) do |r|
          (1..@width).each do |w|
            @map[w][r] = @map[w][r-1]
          end
        end

        (1..@width).each do |w|
          @map[w][1] = [true, 'none']
        end
      end

      def squeeze_rows(rows)
        rows.each do |row|
          squeeze_row row
        end
      end
    end
  end
end
