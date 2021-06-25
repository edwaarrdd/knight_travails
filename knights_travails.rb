class Node
    attr_accessor :value, :prev, :tlt, :trt, :tll, :trr, :blb, :brb, :brr, :bll
    def initialize(value, prev = nil, tlt = nil, trt = nil, tll = nil, trr = nil, blb = nil, brb = nil, bll = nil, brr = nil)
        @value = value
        @prev = prev
        @tlt = tlt
        @trt = trt
        @tll = tll
        @trr = trr
        @blb = blb
        @brb = brb
        @brr = brr
        @bll = bll
    end
end

class Knight
    attr_accessor :root, :level_array, :moves
    @@max_moves = 8

    @@possible_moves = {
        :tlt => [-1, 2],
        :trt => [1, 2],
        :tll => [-2, 1],
        :trr => [2, 1],
        :blb => [-1, -2],
        :brb => [1, -2],
        :brr => [2, -1],
        :bll => [-2, -1]
    }

    def initialize(start, finish)
        @root = Node.new(start)
        @moves = 0
        @level_queue = []
        @level_array = []
        @node_array = []
        @final_array = []
        @arr = [@root]
        make_board()
        add_moves(@root)
        level_order_find(@root, finish)
    end

    def make_board()
        @board = Array.new (8) { Array.new(8) }
        @board.each_with_index do |row, row_index|
            row.map!.with_index {|x,y| [row_index, y]}
        end        
        @board.flatten!(1)
    end

    def add_moves(root)
        @@possible_moves.each do |k, v|
            if root.public_send(k) == nil
                x_coord = root.value[0] + v[0]
                y_coord = root.value[1] + v[1]
                if @board.reject! {|x,y| x== x_coord && y ==y_coord}
                    if k == :tlt
                        root.tlt = Node.new([x_coord, y_coord], root)
                        @arr.push(root.tlt)
                    elsif k == :trt
                        root.trt = Node.new([x_coord, y_coord], root)
                        @arr.push(root.trt)
                    elsif k == :tll
                        root.tll = Node.new([x_coord, y_coord], root)
                        @arr.push(root.tll)
                    elsif k == :trr
                        root.trr = Node.new([x_coord, y_coord], root)
                        @arr.push(root.trr)
                    elsif k == :brb
                        root.brb = Node.new([x_coord, y_coord], root)
                        @arr.push(root.brb)
                    elsif k == :blb
                        root.blb = Node.new([x_coord, y_coord], root)
                        @arr.push(root.blb)
                    elsif k == :bll
                        root.bll = Node.new([x_coord, y_coord], root)
                        @arr.push(root.bll)
                    else
                        root.brr = Node.new([x_coord, y_coord], root)
                        @arr.push(root.brr)
                    end
                end
            end 
        end
        @arr.shift()
        @moves += 1 
        if @moves < 64
            add_moves(@arr[0])
        end
    end


    def level_order_find(node = @root, finish)
        if (node == nil) 
            return
        else
            @level_queue.push(node)
            while @level_queue != []
                node = @level_queue[0]
                @level_array.push(node.value)
                @node_array.push(node)
                if node.tlt != nil
                    @level_queue.push(node.tlt)
                end
                if node.trt != nil
                    @level_queue.push(node.trt)
                end
                if node.tll != nil
                    @level_queue.push(node.tll)
                end
                if node.trr != nil
                    @level_queue.push(node.trr)
                end
                if node.blb != nil
                    @level_queue.push(node.blb)
                end
                if node.brb != nil
                    @level_queue.push(node.brb)
                end
                if node.bll != nil
                    @level_queue.push(node.bll)
                end
                if node.brr != nil
                    @level_queue.push(node.brr)
                end
                @level_queue.shift(1)
            end
            # puts @level_array
            if @level_array.include?(finish)
                puts "Found"
                @location =  @level_array.index(finish)
                @final_node = @node_array[@location]
                
                @final_array.unshift(@final_node.value)
                while @final_node.prev != nil
                    @final_array.unshift(@final_node.prev.value)
                    @final_node = @final_node.prev
                end
                puts "You made it in #{@final_array.length} moves! Here's your path: "
                print @final_array
            else
                puts "Not found"
            end
        end
    end
end

def knights_moves(start, finish)
    knight = Knight.new(start, finish)
end

knights_moves([0,0], [0,1])

