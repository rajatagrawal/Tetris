require_relative 'main'
module Tetris
  module GameStrategy
    module Squeeze
      def rows_to_squeeze
        squeeze_row = (1..height).to_a
        (1..height).each do |row|
          (1..width).each do |col|
            if @tetris_map[col][row] == true
              squeeze_row.delete(row)
              break
            end
          end
        end
        squeeze_row.sort
      end

      def squeeze_row(row)
        ((row)..2).each do |r|
          (1..width).each do |w|
            @tetris_map[w][r] = @tetris_map[w][r-1]
          end
        end

        (1..width).each do |w|
          @tetris_map[w][1] = true
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
