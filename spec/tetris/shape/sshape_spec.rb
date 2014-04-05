require 'spec_helper'
require 'tetris/shape/sshape'
module Tetris
  describe SShape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures top left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        sshape = SShape.new(window, config)
        expect(sshape.top_left_block.x).to eq 10
        expect(sshape.top_left_block.y).to eq 10
        expect(sshape.top_left_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        sshape = SShape.new(window, config)
        expect(sshape.bottom_left_block.x).to eq 10
        expect(sshape.bottom_left_block.y).to eq 11
        expect(sshape.bottom_left_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures top right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        sshape = SShape.new(window, config)
        expect(sshape.top_right_block.x).to eq 11
        expect(sshape.top_right_block.y).to eq 11
        expect(sshape.top_right_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        sshape = SShape.new(window, config)
        expect(sshape.bottom_right_block.x).to eq 11
        expect(sshape.bottom_right_block.y).to eq 12
        expect(sshape.bottom_right_block.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of square' do
        square = SShape.new window
        expect(square.height).to eq 3
      end
    end

    describe '#width' do
      it 'returns width of square' do
        square = SShape.new window
        expect(square.width).to eq 2
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        square = SShape.new(window, config)
        block_coordinates = [[20,20, Gosu::Color::BLUE],
                             [20,21, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE],
                             [21,22, Gosu::Color::BLUE]]
        expect(square.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the SShape' do
        sshape = SShape.new window
        expect(sshape.top_left_block).to receive(:draw)
        expect(sshape.top_right_block).to receive(:draw)
        expect(sshape.bottom_left_block).to receive(:draw)
        expect(sshape.bottom_right_block).to receive(:draw)
        sshape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        sshape = SShape.new window

        expect{sshape.move('down')}.
          to change{sshape.y}.by(1)
        expect{sshape.move('down')}.
          to change{sshape.top_left_block.y}.by(1)
        expect{sshape.move('down')}.
          to change{sshape.top_right_block.y}.by(1)
        expect{sshape.move('down')}.
          to change{sshape.bottom_left_block.y}.by(1)
        expect{sshape.move('down')}.
          to change{sshape.bottom_right_block.y}.by(1)
      end

      it 'moves itself up' do
        sshape = SShape.new window 
        expect{sshape.move('up')}.
          to change{sshape.y}.by(-1)
        expect{sshape.move('up')}.
          to change{sshape.top_left_block.y}.by(-1)
        expect{sshape.move('up')}.
          to change{sshape.top_right_block.y}.by(-1)
        expect{sshape.move('up')}.
          to change{sshape.bottom_left_block.y}.by(-1)
        expect{sshape.move('up')}.
          to change{sshape.bottom_right_block.y}.by(-1)
      end

      it 'moves itself right' do
        sshape = SShape.new window 
        expect{sshape.move('right')}.
          to change{sshape.x}.by(1)
        expect{sshape.move('right')}.
          to change{sshape.top_left_block.x}.by(1)
        expect{sshape.move('right')}.
          to change{sshape.top_right_block.x}.by(1)
        expect{sshape.move('right')}.
          to change{sshape.bottom_left_block.x}.by(1)
        expect{sshape.move('right')}.
          to change{sshape.bottom_right_block.x}.by(1)
      end

      it 'moves itself left' do
        sshape = SShape.new window 
        expect{sshape.move('left')}.
          to change{sshape.x}.by(-1)
        expect{sshape.move('left')}.
          to change{sshape.top_left_block.x}.by(-1)
        expect{sshape.move('left')}.
          to change{sshape.top_right_block.x}.by(-1)
        expect{sshape.move('left')}.
          to change{sshape.bottom_left_block.x}.by(-1)
        expect{sshape.move('left')}.
          to change{sshape.bottom_right_block.x}.by(-1)
      end
    end
  end
end
