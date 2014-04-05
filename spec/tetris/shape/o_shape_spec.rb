require 'spec_helper'
require 'tetris/shape/o_shape'
module Tetris
  describe O_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        o_shape = O_Shape.new(window, config)
        expect(o_shape.block_1.x).to eq 10
        expect(o_shape.block_1.y).to eq 10
        expect(o_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        o_shape = O_Shape.new(window, config)
        expect(o_shape.block_2.x).to eq 11
        expect(o_shape.block_2.y).to eq 10
        expect(o_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        o_shape = O_Shape.new(window, config)
        expect(o_shape.block_3.x).to eq 10
        expect(o_shape.block_3.y).to eq 11
        expect(o_shape.block_3.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        o_shape = O_Shape.new(window, config)
        expect(o_shape.block_4.x).to eq 11
        expect(o_shape.block_4.y).to eq 11
        expect(o_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of o_shape' do
        o_shape = O_Shape.new window
        expect(o_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of o_shape' do
        o_shape = O_Shape.new window
        expect(o_shape.width).to eq 2
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        o_shape = O_Shape.new(window, config)
        block_coordinates = [[20,20, Gosu::Color::BLUE],
                             [21,20, Gosu::Color::BLUE],
                             [20,21, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE]]
        expect(o_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the O_Shape' do
        o_shape = O_Shape.new window
        expect(o_shape.block_1).to receive(:draw)
        expect(o_shape.block_2).to receive(:draw)
        expect(o_shape.block_3).to receive(:draw)
        expect(o_shape.block_4).to receive(:draw)
        o_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        o_shape = O_Shape.new window

        expect{o_shape.move('down')}.
          to change{o_shape.y}.by(1)
        expect{o_shape.move('down')}.
          to change{o_shape.block_1.y}.by(1)
        expect{o_shape.move('down')}.
          to change{o_shape.block_2.y}.by(1)
        expect{o_shape.move('down')}.
          to change{o_shape.block_3.y}.by(1)
        expect{o_shape.move('down')}.
          to change{o_shape.block_4.y}.by(1)
      end

      it 'moves itself up' do
        o_shape = O_Shape.new window
        expect{o_shape.move('up')}.
          to change{o_shape.y}.by(-1)
        expect{o_shape.move('up')}.
          to change{o_shape.block_1.y}.by(-1)
        expect{o_shape.move('up')}.
          to change{o_shape.block_2.y}.by(-1)
        expect{o_shape.move('up')}.
          to change{o_shape.block_3.y}.by(-1)
        expect{o_shape.move('up')}.
          to change{o_shape.block_4.y}.by(-1)
      end

      it 'moves itself right' do
        o_shape = O_Shape.new window
        expect{o_shape.move('right')}.
          to change{o_shape.x}.by(1)
        expect{o_shape.move('right')}.
          to change{o_shape.block_1.x}.by(1)
        expect{o_shape.move('right')}.
          to change{o_shape.block_2.x}.by(1)
        expect{o_shape.move('right')}.
          to change{o_shape.block_3.x}.by(1)
        expect{o_shape.move('right')}.
          to change{o_shape.block_4.x}.by(1)
      end

      it 'moves itself left' do
        o_shape = O_Shape.new window
        expect{o_shape.move('left')}.
          to change{o_shape.x}.by(-1)
        expect{o_shape.move('left')}.
          to change{o_shape.block_1.x}.by(-1)
        expect{o_shape.move('left')}.
          to change{o_shape.block_2.x}.by(-1)
        expect{o_shape.move('left')}.
          to change{o_shape.block_3.x}.by(-1)
        expect{o_shape.move('left')}.
          to change{o_shape.block_4.x}.by(-1)
      end
    end
  end
end
