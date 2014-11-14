require 'tetris/engine/shape/block'

module Tetris
  describe Block do
    let(:block) { Block.new }

    describe '#height' do
      it 'returns the height of block to 1' do
        expect(block.height).to eq 1
      end
    end

    describe '#width' do
      it 'returns the width of block to 1' do
        expect(block.width).to eq 1
      end
    end

    describe '#move' do
      it 'increase x by 1 on moving right' do
        expect { block.move('right') }.
          to change{ block.x }.by(1)
      end

      it 'decreases x by 1 on moving left' do
        expect { block.move('left') }.
          to change{ block.x }.by(-1)
      end

      it 'increase y by 1 on moving down' do
        expect { block.move('down') }.
          to change{ block.y }.by(1)
      end

      it 'decreases y by 1 on moving up' do
        expect { block.move('up') }.
          to change{ block.y }.by(-1)
      end
    end
  end
end
