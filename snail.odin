package main
import "core:fmt"

snail :: proc(xss: [][]int) -> [dynamic]int {
    yss := [dynamic]int{}

    h := len(xss)
    if h == 0 { return yss }
    w := len(xss[0])
    if w == 0 { return yss }

    for b in 0..=max(h, w) {
        ex := w - b - 1
        ey := h - b - 1

        for c in b..=ex            { append(&yss, xss[b][c]) }
        for r in (b + 1)..=ey      { append(&yss, xss[r][ex]) }

        if ex == b || ey == b { return yss }

        for c_off in b..<ex        { append(&yss, xss[ey][ex - 1 - c_off]) }
        for r_off in (b + 1)..<ey  { append(&yss, xss[ey - r_off][b]) }
    }

    return yss
}

eq :: proc(a: []$T, b: []$S) -> bool {
    if len(a) != len(b) { return false }
    for i in 0..<len(a) {
        if a[i] != b[i] { return false }
    }
    return true
}


main :: proc() {
    initial := [][]int{ {1, 2, 3}, {4, 5, 6}, {7, 8, 9} }
    expected := [dynamic]int{1, 2, 3, 6, 9, 8, 7, 4, 5}
    fmt.println(eq(snail(initial)[:], expected[:]))

    initial = [][]int{ {1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12} }
    expected = {1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7}
    fmt.println(eq(snail(initial)[:], expected[:]))

    initial = [][]int{ {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {10, 11, 12}, {13, 14, 15} }
    expected = [dynamic]int{1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11}
    fmt.println(eq(snail(initial)[:], expected[:]))

    fmt.println("all tests passed")
}
