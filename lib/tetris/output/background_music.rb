module Tetris
  module Output
    class BackgroundMusic

      def initialize(context, song_name)
        @background_music = Gosu::Song.new(context, song_name)
      end

      def play_music
        @background_music.play true
      end
    end
  end
end
