require 'spec_helper'
require 'tetris/shape/s_shape'
module Tetris
  describe S_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures top left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.top_left_block.x).to eq 10
        expect(s_shape.top_left_block.y).to eq 10
        expect(s_shape.top_left_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.bottom_left_block.x).to eq 10
        expect(s_shape.bottom_left_block.y).to eq 11
        expect(s_shape.bottom_left_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures top right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.top_right_block.x).to eq 11
        expect(s_shape.top_right_block.y).to eq 11
        expect(s_shape.top_right_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.bottom_right_block.x).to eq 11
        expect(s_shape.bottom_right_block.y).to eq 12
        expect(s_shape.bottom_right_block.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of s_shape' do
        s_shape = S_Shape.new window
        expect(s_shape.height).to eq 3
      end
    end

    describe '#width' do
      it 'returns width of s_shape' do
        s_shape = S_Shape.new window
        expect(s_shape.width).to eq 2
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        s_shape = S_Shape.new(window, config)
        block_coordinates = [[20,20, Gosu::Color::BLUE],
                             [20,21, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE],
                             [21,22, Gosu::Color::BLUE]]
        expect(s_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the S_Shape' do
        s_shape = S_Shape.new window
        expect(s_shape.top_left_block).to receive(:draw)
        expect(s_shape.top_right_block).to receive(:draw)
        expect(s_shape.bottom_left_block).to receive(:draw)
        expect(s_shape.bottom_right_block).to receive(:draw)
        s_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        s_shape = S_Shape.new window

        expect{s_shape.move('down')}.
          to change{s_shape.y}.by(1)
        expect{s_shape.move('down')}.
          to change{s_shape.top_left_block.y}.by(1)
        expect{s_shape.move('down')}.
          to change{s_shape.top_right_block.y}.by(1)
        expect{s_shape.move('down')}.
          to change{s_shape.bottom_left_block.y}.by(1)
        expect{s_shape.move('down')}.
          to change{s_shape.bottom_right_block.y}.by(1)
      end

      it 'moves itself up' do
        s_shape = S_Shape.new window
        expect{s_shape.move('up')}.
          to change{s_shape.y}.by(-1)
        expect{s_shape.move('up')}.
          to change{s_shape.top_left_block.y}.by(-1)
        expect{s_shape.move('up')}.
          to change{s_shape.top_right_block.y}.by(-1)
        expect{s_shape.move('up')}.
          to change{s_shape.bottom_left_block.y}.by(-1)
        expect{s_shape.move('up')}.
          to change{s_shape.bottom_right_block.y}.by(-1)
      end

      it 'moves itself right' do
        s_shape = S_Shape.new window
        expect{s_shape.move('right')}.
          to change{s_shape.x}.by(1)
        expect{s_shape.move('right')}.
          to change{s_shape.top_left_block.x}.by(1)
        expect{s_shape.move('right')}.
          to change{s_shape.top_right_block.x}.by(1)
        expect{s_shape.move('right')}.
          to change{s_shape.bottom_left_block.x}.by(1)
        expect{s_shape.move('right')}.
          to change{s_shape.bottom_right_block.x}.by(1)
      end

      it 'moves itself left' do
        s_shape = S_Shape.new window
        expect{s_shape.move('left')}.
          to change{s_shape.x}.by(-1)
        expect{s_shape.move('left')}.
          to change{s_shape.top_left_block.x}.by(-1)
        expect{s_shape.move('left')}.
          to change{s_shape.top_right_block.x}.by(-1)
        expect{s_shape.move('left')}.
          to change{s_shape.bottom_left_block.x}.by(-1)
        expect{s_shape.move('left')}.
          to change{s_shape.bottom_right_block.x}.by(-1)
      end
    end
  end
end
