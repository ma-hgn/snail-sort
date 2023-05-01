fn (xss [][]int) snail() []int {
	mut ys := []int{}

	h := xss.len
	if h == 0 { return ys }
	w := xss[0].len
	if w == 0 { return ys }

	for b in 0 .. (max(h, w)) {
		ex := w - b - 1
		ey := h - b - 1

		for c in b .. (ex + 1)       { ys << xss[b][c] }
		for r in (b + 1) .. (ey + 1) { ys << xss[r][ex] }

		if ex == b || ey == b { return ys }

		for c in (b + 1) .. (ex + 1) { ys << xss[ey][ex - c] }
		for r in (b + 1) .. ey       { ys << xss[ey - r][b] }
	}
	return ys
}

fn max(a int, b int) int { if a > b { return a } else { return b } }

fn main() {
	mut initial := [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
	mut expected := [1, 2, 3, 6, 9, 8, 7, 4, 5]
	assert initial.snail() == expected
	println(initial.snail() == expected)

	initial = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
	expected = [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
	assert initial.snail() == expected
	println(initial.snail() == expected)

	initial = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9], 
        [10, 11, 12], 
        [13, 14, 15]
    ]
	expected = [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11]
	assert initial.snail() == expected
	println(initial.snail() == expected)

	println('all tests passed')
}
