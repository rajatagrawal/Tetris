require 'tetris/main'

module Tetris
  describe GameWindow do

    describe '#initialize' do
      it 'initializes the window' do
        window = GameWindow.new
        expect(window.width).to eq 1280
        expect(window.height).to eq 1080
        expect(window.caption).to eq 'Tetris'
      end
    end
  end
end
