require 'spec_helper'
require 'tetris/shape/z_shape'
module Tetris
  describe Z_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.block_1.x).to eq 10
        expect(z_shape.block_1.y).to eq 10
        expect(z_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.block_2.x).to eq 11
        expect(z_shape.block_2.y).to eq 10
        expect(z_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.block_3.x).to eq 11
        expect(z_shape.block_3.y).to eq 11
        expect(z_shape.block_3.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        z_shape = Z_Shape.new(window, config)
        expect(z_shape.block_4.x).to eq 12
        expect(z_shape.block_4.y).to eq 11
        expect(z_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of z_shape' do
        z_shape = Z_Shape.new window
        expect(z_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of z_shape' do
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
        expect(z_shape.block_1).to receive(:draw)
        expect(z_shape.block_2).to receive(:draw)
        expect(z_shape.block_3).to receive(:draw)
        expect(z_shape.block_4).to receive(:draw)
        z_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        z_shape = Z_Shape.new window

        expect{z_shape.move('down')}.
          to change{z_shape.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.block_1.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.block_2.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.block_3.y}.by(1)
        expect{z_shape.move('down')}.
          to change{z_shape.block_4.y}.by(1)
      end

      it 'moves itself up' do
        z_shape = Z_Shape.new window
        expect{z_shape.move('up')}.
          to change{z_shape.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.block_1.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.block_2.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.block_3.y}.by(-1)
        expect{z_shape.move('up')}.
          to change{z_shape.block_4.y}.by(-1)
      end

      it 'moves itself right' do
        z_shape = Z_Shape.new window
        expect{z_shape.move('right')}.
          to change{z_shape.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.block_1.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.block_2.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.block_3.x}.by(1)
        expect{z_shape.move('right')}.
          to change{z_shape.block_4.x}.by(1)
      end

      it 'moves itself left' do
        z_shape = Z_Shape.new window
        expect{z_shape.move('left')}.
          to change{z_shape.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.block_1.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.block_2.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.block_3.x}.by(-1)
        expect{z_shape.move('left')}.
          to change{z_shape.block_4.x}.by(-1)
      end
    end
  end
end
