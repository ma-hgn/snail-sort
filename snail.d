import std.stdio;
import std.algorithm;

T[] snail(T)(T[][] xss) 
{
    ulong h = xss.length;
    if (h == 0) { return []; }
    ulong w = xss[0].length;
    if (w == 0) { return []; }

    T[] v = [];

    foreach (b; 0..((max(w, h) / 2)+1)) {
        ulong ex = w - b - 1;
        ulong ey = h - b - 1;

        foreach (c; b..ex+1)
            v ~= [xss[b][c]];
        foreach (r; b+1..ey+1)
            v ~= [xss[r][ex]];

        if (ex == b || ey == b) {
            return v;
        }

        foreach (o; b..ex)
            v ~= [xss[ey][ex-1-o]];
        foreach (o; b+1..ey)
            v ~= [xss[ey-o][b]];
    }
    return v;
}

void main()
{
    int[][] initial = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    int[] expected = [1,2,3,6,9,8,7,4,5];

    assert(snail(initial) == expected);
    writeln(snail(initial) == expected);

    initial = [[1, 2, 3, 4],  [5, 6, 7, 8],  [9, 10, 11, 12]];
    expected = [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7];

    assert(snail(initial) == expected);
    writeln(snail(initial) == expected);

    initial = [
        [1, 2, 3], 
        [4, 5, 6], 
        [7, 8, 9], 
        [10, 11, 12], 
        [13, 14, 15]
    ];
    expected = [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11];

    assert(snail(initial) == expected);
    writeln(snail(initial) == expected);

    "all tests passed".writeln;
}
