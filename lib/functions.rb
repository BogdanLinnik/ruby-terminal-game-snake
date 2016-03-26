module Func

  # catch user input (arrow keys and ESC)
  def Func.user_control
    while true
      input = $stdin.getch
      
      input == "\e" ? input += $stdin.read_nonblock(2) rescue "" : next
      
      case input
      when "\e[A" # up arrow
        $direction = "up"
      when "\e[B" # down arrow
        $direction = "down"
      when "\e[C" # right arrow
        $direction = "right"
      when "\e[D" # left arrow
        $direction = "left"
      when "\e"
        Func.game_over
      else
        next
      end
    end
  end

  def Func.game_over
    puts "\e[41m\e[30m Game Over \e[0m\n\e[49m\r" 
    exit
  end

end
