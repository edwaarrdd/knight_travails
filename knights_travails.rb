class Node
    attr_accessor :value, :tlt, :trt, :tll, :trr, :blb, :brb, :brr, :bll
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
    attr_accessor :root, :level_array
    @@max_moves = 0 

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
        @level_queue = []
        @level_array = []
        add_moves(@root)
        level_order_find(@root, finish)
    end

    def add_moves(root)
        @arr = []
        @@possible_moves.each do |k, v|
            if root.public_send(k) == nil
                x_coord = root.value[0] + v[0]
                y_coord = root.value[1] + v[1]
                if x_coord <= 8 && x_coord >= 0 && y_coord <=8 && y_coord >= 0
                    if k == :tlt
                        root.tlt = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :trt
                        root.trt = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :tll
                        root.tll = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :trr
                        root.trr = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :brb
                        root.brb = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :blb
                        root.blb = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :bll
                        root.bll = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    elsif k == :brr
                        root.brr = Node.new([x_coord, y_coord], root.value)
                        @arr.push([x_coord, y_coord])
                    else
                        puts "does not exist"
                    end
                end
            end
        end
    end


    def level_order_find(node = @root, finish)
        if (node == nil) 
            return
        else
            @level_queue.push(node)
            if node == finish
            while @level_queue != []
                node = @level_queue[0]
                @level_array.push(node.value)
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
            puts @level_array
            if @level_array.include?(finish)
                puts "found"
            else
                puts "not found"
            end
            return @level_array
        end
    end
end


def knights_moves(start, finish)
    knight = Knight.new(start, finish)
end

knights_moves([3,4], [5,5])

