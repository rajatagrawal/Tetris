module Tetris
  module UI
    module Font
      class Font
        def initialize(context)
          @context = context
          @font = Gosu::Font.new(@context, 'Arial', 30)
        end

        def draw(text, x=0, y=0, z=0, tx=0, ty=0)
          @context.translate(tx, ty) do
            @font.draw(text, x,y,z)
          end
        end
      end
    end
  end
end
