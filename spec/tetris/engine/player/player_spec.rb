require 'tetris/engine/player/player'

module Tetris
  describe Player do
    describe '#increase_score' do
      it 'increases the score by the passed value argument' do
        player = Player.new
        expect{ player.increase_score(20) }.to change{ player.score }.  by(20)
      end
    end
    
    describe 'player_number' do
      it 'new player gets an incremented unique number' do
        expect(Player.new.number).to eq 1
        expect(Player.new.number).to eq 2
      end
    end
  end
end
