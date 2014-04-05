require 'spec_helper'
require 'tetris/shape/l_shape'
module Tetris
  describe L_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        l_shape = L_Shape.new(window, config)
        expect(l_shape.block_1.x).to eq 10
        expect(l_shape.block_1.y).to eq 11
        expect(l_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        l_shape = L_Shape.new(window, config)
        expect(l_shape.block_2.x).to eq 11
        expect(l_shape.block_2.y).to eq 11
        expect(l_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        l_shape = L_Shape.new(window, config)
        expect(l_shape.block_3.x).to eq 12
        expect(l_shape.block_3.y).to eq 11
        expect(l_shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        l_shape = L_Shape.new(window, config)
        expect(l_shape.block_4.x).to eq 12
        expect(l_shape.block_4.y).to eq 10
        expect(l_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of l_shape' do
        l_shape = L_Shape.new window
        expect(l_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of l_shape' do
        l_shape = L_Shape.new window
        expect(l_shape.width).to eq 3
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        l_shape = L_Shape.new(window, config)
        block_coordinates = [[20,21, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE],
                             [22,21, Gosu::Color::BLUE],
                             [22,20, Gosu::Color::BLUE]]
        expect(l_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the L_Shape' do
        l_shape = L_Shape.new window
        expect(l_shape.block_1).to receive(:draw)
        expect(l_shape.block_2).to receive(:draw)
        expect(l_shape.block_3).to receive(:draw)
        expect(l_shape.block_4).to receive(:draw)
        l_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        l_shape = L_Shape.new window

        expect{l_shape.move('down')}.
          to change{l_shape.y}.by(1)
        expect{l_shape.move('down')}.
          to change{l_shape.block_1.y}.by(1)
        expect{l_shape.move('down')}.
          to change{l_shape.block_2.y}.by(1)
        expect{l_shape.move('down')}.
          to change{l_shape.block_3.y}.by(1)
        expect{l_shape.move('down')}.
          to change{l_shape.block_4.y}.by(1)
      end

      it 'moves itself up' do
        l_shape = L_Shape.new window
        expect{l_shape.move('up')}.
          to change{l_shape.y}.by(-1)
        expect{l_shape.move('up')}.
          to change{l_shape.block_1.y}.by(-1)
        expect{l_shape.move('up')}.
          to change{l_shape.block_2.y}.by(-1)
        expect{l_shape.move('up')}.
          to change{l_shape.block_3.y}.by(-1)
        expect{l_shape.move('up')}.
          to change{l_shape.block_4.y}.by(-1)
      end

      it 'moves itself right' do
        l_shape = L_Shape.new window
        expect{l_shape.move('right')}.
          to change{l_shape.x}.by(1)
        expect{l_shape.move('right')}.
          to change{l_shape.block_1.x}.by(1)
        expect{l_shape.move('right')}.
          to change{l_shape.block_2.x}.by(1)
        expect{l_shape.move('right')}.
          to change{l_shape.block_3.x}.by(1)
        expect{l_shape.move('right')}.
          to change{l_shape.block_4.x}.by(1)
      end

      it 'moves itself left' do
        l_shape = L_Shape.new window
        expect{l_shape.move('left')}.
          to change{l_shape.x}.by(-1)
        expect{l_shape.move('left')}.
          to change{l_shape.block_1.x}.by(-1)
        expect{l_shape.move('left')}.
          to change{l_shape.block_2.x}.by(-1)
        expect{l_shape.move('left')}.
          to change{l_shape.block_3.x}.by(-1)
        expect{l_shape.move('left')}.
          to change{l_shape.block_4.x}.by(-1)
      end
    end
  end
end
