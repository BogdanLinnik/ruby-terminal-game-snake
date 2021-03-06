class Field
  BLACKSQ = "\xe2\xac\x9b "
  WHITESQ = "\xe2\xac\x9c "
  
  attr_reader :cells
  attr_reader :size
  attr_accessor :score
  
  def initialize(size)
    @size = size
    @score = 0
  end
  
  def create_field
    # populating two dimensional array
    @cells = []
    (0...@size).each do |x|
      @row = []
      (0...@size).each do |y|
        if x.between?(1, @size-2) && y.between?(1, @size-2)
          @row.push(WHITESQ)
        else
          @row.push(BLACKSQ)
        end
      end
      @cells.push(@row)
    end
  end
  
  def print_field
    # clear user terminal
    system 'clear'
    # terminal color -> green
    print "\e[32m"
    @cells.each do |row|
      row.each do |cell|
        print cell
      end
      # !important - carriege return
      print "\n\r"
    end
    # text == black && background == green
    puts "SCORE: \e[42m\e[30m #{@score} \e[49m\e[32m\r"
    puts "Use \xe2\x87\x84 \xe2\x87\x85 to move, ESC to quit.\r"
  end
  
end
