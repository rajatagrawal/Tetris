require 'spec_helper'
require 'tetris/shape/z_shape'
module Tetris
  describe Z_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures top left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.top_left_block.x).to eq 10
        expect(z_shape.top_left_block.y).to eq 10
        expect(z_shape.top_left_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures top right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.top_right_block.x).to eq 11
        expect(z_shape.top_right_block.y).to eq 10
        expect(z_shape.top_right_block.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.bottom_left_block.x).to eq 11
        expect(z_shape.bottom_left_block.y).to eq 11
        expect(z_shape.bottom_left_block.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures bottom right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.bottom_right_block.x).to eq 12
        expect(z_shape.bottom_right_block.y).to eq 11
        expect(z_shape.bottom_right_block.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of zshape' do
        z_shape = Z_Shape.new window
        expect(z_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of zshape' do
        z_shape = Z_Shape.new window
        expect(z_shape.width).to eq 3
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        z_shape = Z_Shape.new(window, config)
        block_coordinates = [[20,20, Gosu::Color::BLUE],
                             [21,20, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE],
                             [22,21, Gosu::Color::BLUE]]
        expect(z_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the Z_Shape' do
        z_shape = Z_Shape.new window
        expect(z_shape.top_left_block).to receive(:draw)
        expect(z_shape.top_right_block).to receive(:draw)
        expect(z_shape.bottom_left_block).to receive(:draw)
        expect(z_shape.bottom_right_block).to receive(:draw)
        z_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        z_shape = Z_Shape.new window

        expect{z_shape.move('down')}.
          to change{z_shape.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.top_left_block.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.top_right_block.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.bottom_left_block.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.bottom_right_block.y}.by(1)
      end

      it 'moves itself up' do
        z_shape = Z_Shape.new window
        expect{z_shape.move('up')}.
          to change{z_shape.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.top_left_block.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.top_right_block.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.bottom_left_block.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.bottom_right_block.y}.by(-1)
      end

      it 'moves itself right' do
        z_shape = Z_Shape.new window
        expect{z_shape.move('right')}.
          to change{z_shape.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.top_left_block.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.top_right_block.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.bottom_left_block.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.bottom_right_block.x}.by(1)
      end

      it 'moves itself left' do
        z_shape = Z_Shape.new window
        expect{z_shape.move('left')}.
          to change{z_shape.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.top_left_block.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.top_right_block.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.bottom_left_block.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.bottom_right_block.x}.by(-1)
      end
    end
  end
end
