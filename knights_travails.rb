class Node
    attr_accessor :value, :tlt, :trt, :tll, :trr, :blb, :brb, :brr, :bll
    def initialize(value, tlt = nil, trt = nil, tll = nil, trr = nil, blb = nil, brb = nil, bll = nil, brr = nil)
        @value = value
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
        level_order_find(finish)
    end

    def add_moves(root)
        @arr = []
        @@possible_moves.each do |k, v|
            if root.public_send(k) == nil
                x_coord = root.value[0] + v[0]
                y_coord = root.value[1] + v[1]
                if x_coord <= 8 && x_coord >= 0 && y_coord <=8 && y_coord >= 0
                    if k == :tlt
                        root.tlt = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :trt
                        root.trt = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :tll
                        root.tll = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :trr
                        root.trr = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :brb
                        root.brb = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :blb
                        root.blb = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :bll
                        root.bll = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    elsif k == :brr
                        root.brr = Node.new([x_coord, y_coord])
                        @arr.push([x_coord, y_coord])
                    else
                        puts "does not exist"
                    end
                end
            end
        end
    end


    def level_order_find(finish)
        if @arr.include?(finish)
            puts @root
        end
    end
end


def knights_moves(start, finish)
    knight = Knight.new(start, finish)
end

knights_moves([0,0], [1,2])

