require 'grid'

class Sidewinder 

    def self.on(grid) 
        grid.each_row do |row|
            run = []

            row.each do |cell| 
                run << cell

                nothing_to_east = cell.east.nil?
                something_north = !cell.north.nil?
                
                should_close_out = nothing_to_east ||
                    (rand(2) == 1 && something_north)
                
                if should_close_out
                    to_be_closed = run.sample
                    to_be_closed.link(to_be_closed.north) if to_be_closed.north
                    run.clear
                else 
                    cell.link(cell.east)
                end
            end
        end

        grid
    end

end