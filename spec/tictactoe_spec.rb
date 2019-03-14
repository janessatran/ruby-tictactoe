require './tictactoe.rb'

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe '#initialize' do

    it 'initializes a new game' do
      expect(game.game_count).to equal(1)
    end

    it 'sets scores to 0' do
      expect(game.p1_score).to equal(0)
      expect(game.p2_score).to equal(0)
    end

    it 'calls new_game' do
      expect(game).to receive(:new_game)
    end

  end

  describe '#new_game' do

    it 'sets the current player to player 1' do
      expect(game.current_player).to equal(1)
    end  end

end
