require 'spec_helper'
require 'tetris/shape/complex_shape'
module Tetris
  describe ComplexShape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = ComplexShape.new(window, config)
        expect(shape.block_1.x).to eq 10
        expect(shape.block_1.y).to eq 10
        expect(shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = ComplexShape.new(window, config)
        expect(shape.block_2.x).to eq 10
        expect(shape.block_2.y).to eq 10
        expect(shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = ComplexShape.new(window, config)
        expect(shape.block_3.x).to eq 10
        expect(shape.block_3.y).to eq 10
        expect(shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = ComplexShape.new(window, config)
        expect(shape.block_4.x).to eq 10
        expect(shape.block_4.y).to eq 10
        expect(shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 15, y: 15, unit_side: 15, color: 'blue'}
        shape = ComplexShape.new(window, config)
        block_coordinates = [[15,15, Gosu::Color::BLUE],
                             [15,15, Gosu::Color::BLUE],
                             [15,15, Gosu::Color::BLUE],
                             [15,15, Gosu::Color::BLUE]]
        expect(shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the Complex Shape' do
        shape = ComplexShape.new window
        expect(shape.block_1).to receive(:draw)
        expect(shape.block_2).to receive(:draw)
        expect(shape.block_3).to receive(:draw)
        expect(shape.block_4).to receive(:draw)
        shape.draw
      end
    end

    describe '#height' do
      it 'returns  difference of max and min y value of block coordinates' do
        config = { x: 1, y: 1 }
        shape = ComplexShape.new(window, config)
        shape.block_1.y = 4
        shape.block_2.y = 1
        shape.block_3.y = 1
        shape.block_4.y = 1
        expect(shape.height).to eq 4
      end
    end

    describe '#width' do
      it 'returns  difference of max and min x value of block coordinates' do
        config = { x: 1, y: 1 }
        shape = ComplexShape.new(window, config)
        shape.block_1.x = 4
        shape.block_2.x = 1
        shape.block_3.x = 1
        shape.block_4.x = 1
        expect(shape.width).to eq 4
      end
    end

    describe '#move' do
      it 'moves itself down' do
        shape = ComplexShape.new window

        expect{shape.move('down')}.
          to change{shape.y}.by(1)
        expect{shape.move('down')}.
          to change{shape.block_1.y}.by(1)
        expect{shape.move('down')}.
          to change{shape.block_2.y}.by(1)
        expect{shape.move('down')}.
          to change{shape.block_3.y}.by(1)
        expect{shape.move('down')}.
          to change{shape.block_4.y}.by(1)
      end

      it 'moves itself up' do
        shape = ComplexShape.new window
        expect{shape.move('up')}.
          to change{shape.y}.by(-1)
        expect{shape.move('up')}.
          to change{shape.block_1.y}.by(-1)
        expect{shape.move('up')}.
          to change{shape.block_2.y}.by(-1)
        expect{shape.move('up')}.
          to change{shape.block_3.y}.by(-1)
        expect{shape.move('up')}.
          to change{shape.block_4.y}.by(-1)
      end

      it 'moves itself right' do
        shape = ComplexShape.new window
        expect{shape.move('right')}.
          to change{shape.x}.by(1)
        expect{shape.move('right')}.
          to change{shape.block_1.x}.by(1)
        expect{shape.move('right')}.
          to change{shape.block_2.x}.by(1)
        expect{shape.move('right')}.
          to change{shape.block_3.x}.by(1)
        expect{shape.move('right')}.
          to change{shape.block_4.x}.by(1)
      end

      it 'moves itself left' do
        shape = ComplexShape.new window
        expect{shape.move('left')}.
          to change{shape.x}.by(-1)
        expect{shape.move('left')}.
          to change{shape.block_1.x}.by(-1)
        expect{shape.move('left')}.
          to change{shape.block_2.x}.by(-1)
        expect{shape.move('left')}.
          to change{shape.block_3.x}.by(-1)
        expect{shape.move('left')}.
          to change{shape.block_4.x}.by(-1)
      end
    end
  end
end
