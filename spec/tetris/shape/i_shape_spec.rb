require 'spec_helper'
require 'tetris/shape/i_shape'
module Tetris
  describe I_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures top left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        i_shape = I_Shape.new(window, config)
        expect(i_shape.top_left_block.x).to eq 10
        expect(i_shape.top_left_block.y).to eq 10
        expect(i_shape.top_left_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures top right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        i_shape = I_Shape.new(window, config)
        expect(i_shape.top_right_block.x).to eq 11
        expect(i_shape.top_right_block.y).to eq 10
        expect(i_shape.top_right_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        i_shape = I_Shape.new(window, config)
        expect(i_shape.bottom_left_block.x).to eq 12
        expect(i_shape.bottom_left_block.y).to eq 10
        expect(i_shape.bottom_left_block.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures bottom right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        i_shape = I_Shape.new(window, config)
        expect(i_shape.bottom_right_block.x).to eq 13
        expect(i_shape.bottom_right_block.y).to eq 10
        expect(i_shape.bottom_right_block.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of i_shape' do
        i_shape = I_Shape.new window
        expect(i_shape.height).to eq 1
      end
    end

    describe '#width' do
      it 'returns width of i_shape' do
        i_shape = I_Shape.new window
        expect(i_shape.width).to eq 4
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        i_shape = I_Shape.new(window, config)
        block_coordinates = [[20,20, Gosu::Color::BLUE],
                             [21,20, Gosu::Color::BLUE],
                             [22,20, Gosu::Color::BLUE],
                             [23,20, Gosu::Color::BLUE]]
        expect(i_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the I_Shape' do
        i_shape = I_Shape.new window
        expect(i_shape.top_left_block).to receive(:draw)
        expect(i_shape.top_right_block).to receive(:draw)
        expect(i_shape.bottom_left_block).to receive(:draw)
        expect(i_shape.bottom_right_block).to receive(:draw)
        i_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        i_shape = I_Shape.new window

        expect{i_shape.move('down')}.
          to change{i_shape.y}.by(1)
        expect{i_shape.move('down')}.
          to change{i_shape.top_left_block.y}.by(1)
        expect{i_shape.move('down')}.
          to change{i_shape.top_right_block.y}.by(1)
        expect{i_shape.move('down')}.
          to change{i_shape.bottom_left_block.y}.by(1)
        expect{i_shape.move('down')}.
          to change{i_shape.bottom_right_block.y}.by(1)
      end

      it 'moves itself up' do
        i_shape = I_Shape.new window
        expect{i_shape.move('up')}.
          to change{i_shape.y}.by(-1)
        expect{i_shape.move('up')}.
          to change{i_shape.top_left_block.y}.by(-1)
        expect{i_shape.move('up')}.
          to change{i_shape.top_right_block.y}.by(-1)
        expect{i_shape.move('up')}.
          to change{i_shape.bottom_left_block.y}.by(-1)
        expect{i_shape.move('up')}.
          to change{i_shape.bottom_right_block.y}.by(-1)
      end

      it 'moves itself right' do
        i_shape = I_Shape.new window
        expect{i_shape.move('right')}.
          to change{i_shape.x}.by(1)
        expect{i_shape.move('right')}.
          to change{i_shape.top_left_block.x}.by(1)
        expect{i_shape.move('right')}.
          to change{i_shape.top_right_block.x}.by(1)
        expect{i_shape.move('right')}.
          to change{i_shape.bottom_left_block.x}.by(1)
        expect{i_shape.move('right')}.
          to change{i_shape.bottom_right_block.x}.by(1)
      end

      it 'moves itself left' do
        i_shape = I_Shape.new window
        expect{i_shape.move('left')}.
          to change{i_shape.x}.by(-1)
        expect{i_shape.move('left')}.
          to change{i_shape.top_left_block.x}.by(-1)
        expect{i_shape.move('left')}.
          to change{i_shape.top_right_block.x}.by(-1)
        expect{i_shape.move('left')}.
          to change{i_shape.bottom_left_block.x}.by(-1)
        expect{i_shape.move('left')}.
          to change{i_shape.bottom_right_block.x}.by(-1)
      end
    end
  end
end
