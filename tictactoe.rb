class TicTacToe

  @@win_values = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
               [1, 4, 7], [2, 5, 8], [3, 6, 9],
               [1, 5, 9], [3, 5, 7]]

  attr_reader :p1_score, :p2_score, :board,
              :p1_selections, :p2_selections,
              :game_count, :current_player

  def initialize
    @p1_score = 0
    @p2_score = 0
    @game_count = 0
    @p1_selections = []
    @p2_selections = []
    reset_board
    new_game
  end

  def display_rules
    puts 'Player One is X, Player Two is O. Please select a value 1-9 correspdoning to a space on the board. First player to get 3 marks in a row wins!'
  end

  def check_ready?
    puts 'Please hit enter if ready.'
    ready = gets.chomp
    ready == "\n"
    return ready
  end

  def reset_selections
    p1_selections = []
    p2_selections = []
  end

  def reset_scores
    p1_score = 0
    p2_score = 0
  end

  def new_game
    update_game_count
    @current_player = 1
    reset_scores
    reset_selections
    reset_board
    print_board
    prompt_selection if check_ready?
  end

  def update_game_count
    @game_count > 0 ? @game_count += 1 : @game_count = 1
  end

  def reset_board
    @board = (1..9).to_a
  end

  def get_marker
    current_player == 1 ? 'X' : 'O'
  end

  def update_user_selection(selection)
    current_player == 1 ? p1_selections.push(selection) : p2_selections.push(selection)
  end

  def update_player
    current_player == 1 ? current_player = 0 
  end

  def update_board(selection)
    selection = selection.to_i
    puts selection
    marker = get_marker
    marker == 'X' ? @board[selection - 1] = 'X' : @board[selection - 1] = 'O'
    update_user_selection(selection)
    check_win
    print_board
    prompt_selection
    update_player
  end

  def prompt_selection
    puts 'ready..'
    if current_player == 1
      puts 'Player 1 turn: '
    else
      puts 'Player 2 turn: '
    end
    get_selection
  end

  def get_selection
    selection = gets.chomp
    check_selection_valid(selection)
  end
  
  def check_selection_valid(selection)
    print selection
    return update_board(selection) unless selection.empty?
  end


  def print_board
    display_rules
    puts ' ' + @board[0].to_s + ' | ' + @board[1].to_s + ' | ' + @board[2].to_s + "\n" +
        ' ---------' + "\n" +
        ' ' + @board[3].to_s + ' | ' + @board[4].to_s + ' | ' + @board[5].to_s + "\n" +
        ' ---------' + "\n" + 
        ' ' + @board[6].to_s + ' | ' + @board[6].to_s + ' | ' + @board[8].to_s + "\n"
  end

  def check_win
    @@win_values.each do |v|
      if current_player == 1 && p1_selections.length >= 3
        if (v & p1_selections == p1_selections)
          puts 'Game Over! Player 1 wins!'
          @p1_score += 1
          new_game
      elseif current_player == 2 && p2_selections.length >= 3
        if (v & p2_selections == p2_selections)
          puts 'Game Over! Player 2 wins!'
          @p2_score += 1
          new_game
      elseif board.count { |e| e.is_a? Integer }.zero?
        puts 'Tie!'
        new_game
      end
    end
  end

end
end
end