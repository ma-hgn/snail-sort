
proc snail(xss: seq[seq[int]]): seq[int] =
    let h = len(xss)
    if h == 0:
        return @[]
    let w = len(xss[0])
    if h == 0:
        return @[]
    
    let max = if h > w:
        h
    else:
        w

    var v: seq[int] = @[]

    for b in 0..(max div 2):
        let ex = w - b - 1;
        let ey = h - b - 1;

        for c in b..ex:
            v.add(xss[b][c])

        for r in b+1..ey:
            v.add(xss[r][ex])

        if ex == b or ey == b:
            return v

        for o in b..<ex:
            v.add(xss[ey][ex-1-o])

        for o in b+1..<ey:
            v.add(xss[ey-o][b])

    return v

var initial = @[@[1,2,3],@[4,5,6],@[7,8,9]]
var expected = @[1,2,3,6,9,8,7,4,5]

assert expected == snail(initial)
echo expected == snail(initial)
 
initial = @[@[1, 2, 3, 4], @[5, 6, 7, 8], @[9, 10, 11, 12]]
expected = @[1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]

assert expected == snail(initial)
echo expected == snail(initial)

initial = @[
    @[1, 2, 3],
    @[4, 5, 6],
    @[7, 8, 9],
    @[10, 11, 12],
    @[13, 14, 15]
]
expected = @[1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]

assert expected == snail(initial)
echo expected == snail(initial)

echo "all tests passed"
