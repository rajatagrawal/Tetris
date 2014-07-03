require_relative 'config'
require_relative 'player'

module Tetris
  module Input
    module Keyboard
      class Manager
        include Config


        def initialize(window, game_engine, responsiveness)
          @game_engine = game_engine

          config = { window: window,
                     game_engine: game_engine,
                     responsiveness: responsiveness }

          @player_1 = Player.new(config.merge(keys_config: Config::PLAYER_1))

          @player_2 = Player.new(config.merge(keys_config: Config::PLAYER_2))
        end

        def listener
          player_1_shape = @game_engine.players.first.shape
          player_2_shape = @game_engine.players.last.shape
          @player_1.listener(player_1_shape, player_2_shape)
          @player_2.listener(player_2_shape, player_1_shape)
        end

        def reset_ticker(key)
          case player_config_for_key key
          when Config::PLAYER_1
            @player_1.reset_ticker
          when Config::PLAYER_2
            @player_2.reset_ticker
          end
        end

        private

        def player_config_for_key(key)
          return Config::PLAYER_1 if Config::PLAYER_1.values.include? key
          return Config::PLAYER_2 if Config::PLAYER_2.values.include? key
        end

      end
    end
  end
end
