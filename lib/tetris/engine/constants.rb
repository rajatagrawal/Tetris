require 'tetris/engine/shape/shape_files'

module Tetris
  module Engine
    module Constants

      SHAPES = [I_Shape,
                J_Shape,
                L_Shape,
                O_Shape,
                S_Shape,
                T_Shape,
                Z_Shape]

      BLUE = 'blue'
      RED = 'red'
      GREEN = 'green'
      AQUA = 'aqua'
      YELLOW = 'yellow'
      CYAN = 'cyan'
      FUCHSIA = 'fuchsia'
      NONE = 'none'

      SHAPE_COLORS = [BLUE, RED, GREEN, AQUA, YELLOW, CYAN, FUCHSIA]
    end
  end
end
