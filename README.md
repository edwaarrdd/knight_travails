Knight Travails

Task: Find the shortest distance for a knight to get from one point to another

Create GameBoard
    Restrict the board to 8x8
    Create array of 64 tiles vs Have it set at [0,0], [0,8], [8,0], [8,8]
Create Knight
    Hardcode nodes: (+/-1 OR +/- 2 by +/- 2 OR +/- 1)
        tlt = [-1, 2],
        blb = [-1, -2],
        trt = [1, 2],
        brb = [1, -2],
        tll = [-2, 1],
        bll = [-2, -1],
        trr = [2, 1],
        brr = [2, -1]
    Every option as children
    Maximum children at 8
    
Take input of two coordinates: first is the starting point, second is the end point
Create tree with root of starting position
Make every legal move (ie. between 0-8 x 0-8) children of the tree
Search ?depth order to find the quickest method

Output path to the shortest path
puts "You made it in #{} moves! Here's your path: "