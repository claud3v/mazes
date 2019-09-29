require 'grid'
require 'cell'

class BinaryTree

    def self.on(grid) 
        grid.each_cell do |cell|
            if cell.north || cell.east 
                neighbours = []
                neighbours << cell.north if cell.north
                neighbours << cell.east if cell.east

                neighbour = neighbours.sample

                cell.link(neighbour) if neighbour
            end
        end

        grid
    end
end
