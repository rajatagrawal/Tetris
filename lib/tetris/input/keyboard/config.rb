module Tetris
  module Input
    module Keyboard
      module Config
        PLAYER_1 = { down: Gosu::KbDown,
                     left: Gosu::KbLeft,
                     right: Gosu::KbRight,
                     rotate: Gosu::KbUp,
                     drop: Gosu::KbSpace }

        PLAYER_2 = { down: Gosu::KbS,
                     left: Gosu::KbA,
                     right: Gosu::KbD,
                     rotate: Gosu::KbW,
                     drop: Gosu::KbLeftShift }
      end
    end
  end
end
