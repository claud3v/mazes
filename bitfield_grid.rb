class BitFieldGrid 

    attr_reader :grid

    def initialize(rows, columns)
        @rows = rows
        @columns = columns

        @grid = Array.new(rows) do |row|
            Array.new(columns) do |cell|
                0b1111
            end
        end
    end

end

class BinaryTreeForBitfieldGrid 
    
    def self.on(binaryGrid) 
        
    end
end

BitFieldGrid.new(10, 10)





