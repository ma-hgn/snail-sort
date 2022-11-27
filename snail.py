def snail(xss):
    h = len(xss)
    w = len(xss[0])

    if h == 0 or w == 0:
        return []

    v = []

    for b in range(0, max(w, h) + 1):
        ex = w - b - 1
        ey = h - b - 1

        for c in range(b, ex+1):
            v.append(xss[b][c])
        for r in range(b+1, ey+1):
            v.append(xss[r][ex])

        if ex == b or ey == b:
            return v

        for c in range(ex-1, b-1, -1):
            v.append(xss[ey][c])
        for r in range(ey-1, b, -1):
            v.append(xss[r][b])

    return v

initial = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
expected = [1, 2, 3, 6, 9, 8, 7, 4, 5]

assert(snail(initial) == expected)
print(snail(initial) == expected)

initial = [[1,2,3,4], [5,6,7,8], [9,10,11,12]]
expected = [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]

assert(snail(initial) == expected)
print(snail(initial) == expected)

initial = [
    [1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9], 
    [10, 11, 12], 
    [13, 14, 15]
]
expected = [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]

assert(snail(initial) == expected)
print(snail(initial) == expected)

print("all tests passed")
