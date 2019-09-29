require 'cell'

class Grid 
    attr_reader :rows, :columns

    def initialize(rows, columns)
        @rows = rows
        @columns = columns

        @grid = prepare_grid
        configure_grid
    end

    def prepare_grid
        Array.new(rows) do |row|
            Array.new(columns) do |column|
                Cell.new(row, column)
            end
        end
    end

    def configure_grid
        each_cell do |cell|
            row, col = cell.row, cell.column

            cell.north = self[row - 1, col]
            cell.south = self[row + 1, col]
            cell.west = self[row, col - 1]
            cell.east = self[row, col + 1]
        end
    end

    def [](row, col) 
        return nil unless row.between?(0, @rows - 1)
        return nil unless col.between?(0, @grid[row].count - 1)
        @grid[row][col] 
    end
    
    def random_cell 
        row = rand(@rows)
        col = rand(@columns)

        self[row, col]
    end

    def size
        @rows * @columns
    end

    def each_row
        @grid.each do |row| 
            yield row
        end
    end

    
    def each_cell
        each_row do |row|
            row.each do |cell|
                yield cell if cell
            end
        end
    end

end
