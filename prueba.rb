# frozen_string_literal: true

# Makes the game of life
class Game
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @generationNum = 0
    @grid = []
    @dots_grid = []
    fill_grid
    fill_dots_grid
  end

  # def fill_grid_2
  #   @grid = [ 
  #     ['□','□','□'], 
  #     ['■','■','■'], 
  #     ['□','□','□']
  #   ]
  # end

  def fill_dots_grid
    @rows.times do
      @dots_grid.push(Array.new(@cols, 0))
    end
  end

  def fill_grid
    @rows.times do
      elems_y = []
      @cols.times do
        if rand(3) == 1
          elems_y.push('■')
        else
          elems_y.push('□')
        end
      end
      @grid.push(elems_y)
    end
  end

  def print_grid
    @grid.each do |r|
      puts r.join('')
    end
  end

  # def print_dots_grid
  #   @dots_grid.each do |r|
  #     puts r.join('')
  #   end
  # end

  def puntuar
    @rows.times do |r|
      @cols.times do |c|
        if @grid[r][c] == '■'
          sumarUno(r-1, c-1)
          sumarUno(r-1, c)
          sumarUno(r-1, c+1)
  
          sumarUno(r, c-1)
          sumarUno(r, c+1)

          sumarUno(r+1, c-1)
          sumarUno(r+1, c)
          sumarUno(r+1, c+1)
        end
      end
    end
  end

  def sumarUno(r, c)
    if r >= 0 and r < @rows and c >= 0 and c < @cols
      @dots_grid[r][c] += 1
    end
  end

  def nextGeneration
    new_grid = []
    @rows.times do |r|
      new_grid.push([])
      @cols.times do |c|
        if (@dots_grid[r][c] == 2 and @grid[r][c] == '■') or @dots_grid[r][c] == 3
          new_grid[r][c] = '■'
        else
          new_grid[r][c] = '□'
        end
        @dots_grid[r][c] = 0
      end
    end
    @grid = new_grid
  end

  def loop
    puntuar
    nextGeneration
    puts "Generation: #{@generationNum+=1}"
    print_grid
    if gets.chomp.empty?
      loop
    end
  end
end

ola = Game.new(gets.to_i, gets.to_i)
puts "--Type enter to see the next generation"
puts "--Type any other key and enter to close"
ola.loop