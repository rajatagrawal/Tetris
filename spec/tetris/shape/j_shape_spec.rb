require 'spec_helper'
require 'tetris/shape/j_shape'
module Tetris
  describe J_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        j_shape = J_Shape.new(window, config)
        expect(j_shape.block_1.x).to eq 10
        expect(j_shape.block_1.y).to eq 10
        expect(j_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        j_shape = J_Shape.new(window, config)
        expect(j_shape.block_2.x).to eq 10
        expect(j_shape.block_2.y).to eq 11
        expect(j_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        j_shape = J_Shape.new(window, config)
        expect(j_shape.block_3.x).to eq 11
        expect(j_shape.block_3.y).to eq 11
        expect(j_shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        j_shape = J_Shape.new(window, config)
        expect(j_shape.block_4.x).to eq 12
        expect(j_shape.block_4.y).to eq 11
        expect(j_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of j_shape' do
        j_shape = J_Shape.new window
        expect(j_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of j_shape' do
        j_shape = J_Shape.new window
        expect(j_shape.width).to eq 3
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        j_shape = J_Shape.new(window, config)
        block_coordinates = [[20,20, Gosu::Color::BLUE],
                             [20,21, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE],
                             [22,21, Gosu::Color::BLUE]]
        expect(j_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the J_Shape' do
        j_shape = J_Shape.new window
        expect(j_shape.block_1).to receive(:draw)
        expect(j_shape.block_2).to receive(:draw)
        expect(j_shape.block_3).to receive(:draw)
        expect(j_shape.block_4).to receive(:draw)
        j_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        j_shape = J_Shape.new window

        expect{j_shape.move('down')}.
          to change{j_shape.y}.by(1)
        expect{j_shape.move('down')}.
          to change{j_shape.block_1.y}.by(1)
        expect{j_shape.move('down')}.
          to change{j_shape.block_2.y}.by(1)
        expect{j_shape.move('down')}.
          to change{j_shape.block_3.y}.by(1)
        expect{j_shape.move('down')}.
          to change{j_shape.block_4.y}.by(1)
      end

      it 'moves itself up' do
        j_shape = J_Shape.new window
        expect{j_shape.move('up')}.
          to change{j_shape.y}.by(-1)
        expect{j_shape.move('up')}.
          to change{j_shape.block_1.y}.by(-1)
        expect{j_shape.move('up')}.
          to change{j_shape.block_2.y}.by(-1)
        expect{j_shape.move('up')}.
          to change{j_shape.block_3.y}.by(-1)
        expect{j_shape.move('up')}.
          to change{j_shape.block_4.y}.by(-1)
      end

      it 'moves itself right' do
        j_shape = J_Shape.new window
        expect{j_shape.move('right')}.
          to change{j_shape.x}.by(1)
        expect{j_shape.move('right')}.
          to change{j_shape.block_1.x}.by(1)
        expect{j_shape.move('right')}.
          to change{j_shape.block_2.x}.by(1)
        expect{j_shape.move('right')}.
          to change{j_shape.block_3.x}.by(1)
        expect{j_shape.move('right')}.
          to change{j_shape.block_4.x}.by(1)
      end

      it 'moves itself left' do
        j_shape = J_Shape.new window
        expect{j_shape.move('left')}.
          to change{j_shape.x}.by(-1)
        expect{j_shape.move('left')}.
          to change{j_shape.block_1.x}.by(-1)
        expect{j_shape.move('left')}.
          to change{j_shape.block_2.x}.by(-1)
        expect{j_shape.move('left')}.
          to change{j_shape.block_3.x}.by(-1)
        expect{j_shape.move('left')}.
          to change{j_shape.block_4.x}.by(-1)
      end
    end
  end
end
