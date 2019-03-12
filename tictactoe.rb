class TicTacToe
  @game_count = 0
  $win_values = [[1, 2, 3], [4, 5, 6], [7, 8, 9], 
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
  attr_reader :player_one_score, :player_two_score

  def initialize
    @player_one_score = 0
    @player_two_score = 0
    @game_count = 1
    reset_board
  end

  def display_rules
    puts 'Player One is X, Player Two is O. Please select a value 1-9 correspdoning to a space on the board. First player to get 3 marks in a row wins!'
  end

  def reset_board
    @player_one_selections = []
    @player_two_selections = []
    @current_player = 1
    @game_over = false
    @board = (1..9).to_a
    @game_count > 0 ? @game_count += 1 : @game_count = 1
    print_board
    display_rules
    prompt_selection
  end

  def update_board(player_selection)
    player_selection = player_selection.to_i
    if @current_player == 1
      @board[player_selection] = 'X'
      @player_one_selections.push(player_selection)
    else
      @board[player_selection] = 'O'
      @ßplayer_two_selections.push(player_selection)
    end
    check_win
    @current_player == 1 ? @current_player = 0 : @current_player = 1
    prompt_selection
  end

  def prompt_selection
    if @current_player == 1
      puts 'Player 1 turn: '
    else
      puts 'Player 2 turn: '
    end
    @player_selection = gets.chomp
    update_board(@player_selection)
  end

  def print_board
    puts ' ' + @board[0].to_s + ' | ' + @board[1].to_s + ' | ' + @board[2].to_s + "\n" +
        ' ---------' + "\n" +
        ' ' + @board[3].to_s + ' | ' + @board[4].to_s + ' | ' + @board[5].to_s + "\n" +
        ' ---------' + "\n" + 
        ' ' + @board[6].to_s + ' | ' + @board[6].to_s + ' | ' + @board[8].to_s + "\n"
  end

  def check_win
    $win_values.each do |v|
      if @current_player == 1 && @player_one_selections.length >= 3
        puts ((v & @player_one_selections == @player_one_selections))
        if (v & @player_one_selections == @player_one_selections)
          puts 'Game Over! Player 1 wins!'
          @player_one_score += 1
          reset_board
      elseif @current_player == 2 && @player_two_selections.length >= 3
        if (v & @player_two_selections == @player_two_selections)
          puts 'Game Over! Player 2 wins!' 
          @player_two_score += 1
          reset_board
      elseif @board.count { |e| e.is_a? Integer }.zero?
        puts 'Tie!'
        reset_board
      end
    end
    print_board 
  end

end
end
end