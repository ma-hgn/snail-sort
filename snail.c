#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

size_t max(const size_t*, const size_t*);

void snail(int* xss, int* yss, size_t h, size_t w) {
    if (h == 0 || w == 0)
        return;

    int b, c, r, i = 0;

    for (b = 0; b <= (int)max(&h, &w); b++) {
        int ex = (w - b - 1), ey = (h - b - 1);

        for (c = b; c <= ex; c++) yss[i++] = xss[b * w + c];
        for (r = b + 1; r <= ey; r++) yss[i++] = xss[r * w + ex];
        
        if (ex == b || ey == b) return;

        for (c = ex - 1; c >= b; c--) yss[i++] = xss[ey * w + c];
        for (r = ey - 1; r > b; r--) yss[i++] = xss[r * w + b];
    }
}

size_t max(const size_t *a, const size_t *b) { return (*a < *b ? *b : *a); }

bool validate(int* res, int* exp, size_t len) {
    bool valid = true;
    for (size_t i = 0; i < len; i++) {
        if (res[i] != exp[i]) {
            valid = false;
            break;
        }
    }
    printf(valid ? "true\n" : "false\n");
    return valid;
}

int main(void) {
    bool all_valid = true;

    int initial1[3*3] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int expected1[sizeof(initial1)] = {1, 2, 3, 6, 9, 8, 7, 4, 5};
    int* result = malloc(sizeof(initial1));
    snail(initial1, result, 3, 3);
    all_valid &= validate(result, expected1, sizeof(initial1) / sizeof(int));
    free(result);

    int initial2[3 * 4] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    int expected2[3 * 4] = {1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7};
    result = malloc(sizeof(initial2));
    snail(initial2, result, 3, 4);
    all_valid &= validate(result, expected2, sizeof(initial2) / sizeof(int));
    free(result);

    int initial3[5 * 3] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    int expected3[5 * 3] = {1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11};
    result = malloc(sizeof(initial3));
    snail(initial3, result, 5, 3);
    all_valid &= validate(result, expected3, sizeof(initial3) / sizeof(int));
    free(result);

    printf(all_valid ? "all tests passed\n" : "tests failed\n");

    return 0;
}
