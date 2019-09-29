require 'grid'
require 'sidewinder'

grid = Grid.new(10, 10)
Sidewinder.on(grid)

puts grid

grid.to_png.save "sidewinder_maze.png"