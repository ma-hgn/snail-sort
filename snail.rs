fn snail<T>(xss: &[Vec<T>]) -> Vec<T>
where
    T: Copy,
{
    let h: usize = xss.len();
    let w: usize = xss.get(0).map(Vec::len).unwrap_or(0);

    if w == 0 || h == 0 {
        return Vec::new();
    }

    (0..=(h.max(w) / 2)).fold(Vec::with_capacity(w * h), |mut v, b| {
        let ex = w - b - 1;
        let ey = h - b - 1;

        let it = (b..=ex)
            .map(|c| xss[b][c])
            .chain(((b + 1)..=ey).map(|r| xss[r][ex]));

        if ex == b || ey == b {
            v.extend(it);
            v
        } else {
            v.extend(
                it.chain((b..ex).rev().map(|c| xss[ey][c]))
                    .chain(((b + 1)..ey).rev().map(|r| xss[r][b])),
            );

            v
        }
    })
}

fn main() {
    let initial = &[vec![1, 2, 3], vec![4, 5, 6], vec![7, 8, 9]];
    let expected = vec![1, 2, 3, 6, 9, 8, 7, 4, 5];
    assert_eq!(expected, snail(initial));
    println!("{}", expected == snail(initial));

    let initial = &[vec![1, 2, 3, 4], vec![5, 6, 7, 8], vec![9, 10, 11, 12]];
    let expected = vec![1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7];
    assert_eq!(expected, snail(initial));
    println!("{}", expected == snail(initial));

    let initial = &[
        vec![1, 2, 3],
        vec![4, 5, 6],
        vec![7, 8, 9],
        vec![10, 11, 12],
        vec![13, 14, 15],
    ];
    let expected = vec![1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11];
    assert_eq!(expected, snail(initial));
    println!("{}", expected == snail(initial));
    println!("all tests passed");
}
