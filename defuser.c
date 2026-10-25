#include "defuser.h"

#include <inttypes.h>
#include <stdio.h>

#define MAX_FIELDS 8

#define u64 uint64_t 
#define u32 uint32_t

/*
 * 把 values 中的 count 个整数写成一行“空格分隔的无符号十进制整数”，存入 out。
 * 成功返回 0；count 为 0（还没有实现）、snprintf 出错或结果被截断时返回非零。
 */
static int write_answer(char *out, size_t cap, const uint32_t *values, size_t count) {
    size_t used = 0;
    for (size_t i = 0; i < count; ++i) {
        int size = snprintf(out + used, cap - used, "%s%" PRIu32, i ? " " : "", values[i]);
        if (size < 0 || (size_t)size >= cap - used) return 1;
        used += (size_t)size;
    }
    return count == 0;
}

int solve_phase_1(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 0;

    u32 low = (u32)challenge;
    u32 high = (u32)(challenge >> 32);
    u32 mid = (u32)(challenge >> 16);
    u32 step1 = (mid ^ 0xdcf) + high * 4;
    u32 step0 = (low * 5 + high) ^ 0x57bb;
    values[0] = (step1 + 0xf9b4) ^ step0;
    count = 1;
    return write_answer(out, cap, values, count);
}

int solve_phase_2(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 0;

    values[0] = (((u32)(challenge >> 5) * 2) & 0x7e) + 0x1d;
    for (int k = 1; k < 6; k++) {
        u32 temp = challenge >> (9 + 4 * k);
        temp &= 0xf;
        temp ^= k + 1;
        temp += 3 * values[k-1];
        values[k] = temp;
    }
    count = 6;
    return write_answer(out, cap, values, count);
}

int solve_phase_3(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 0;
    /* phase_03：两个整数
     *   values[0] = challenge & 7            （决定走哪个分支）
     *   values[1] = p3 分支(challenge & 7, (challenge >> 3) ^ (challenge >> 32))
     *   分支编号与 p3_case_N 的序号不是同一个数，按跳转表 0x405820 映射。
     */
    count = 2;
    u32 arg1 = challenge & 7;
    u32 arg2 = (challenge >> 3) ^ (challenge >> 32);
    values[0] = arg1;
    u32 t;
    switch (arg1) {
        case 0:
            t = (arg2 * 2) ^ 0x2197;
            break;
        case 1:
            t = 0xf657 + 5 * arg2;
            break;
        case 2:
            t = 0x3679a + 5 * arg2;
            break;
        case 3:
            t = (arg2 ^ 0x770b) + (arg2 >> 2);
            break;
        case 4:
            t = arg2 * 5 + 0x48639;
            break;
        case 5:
            t = arg2 * 4 ^ 0xa6ba;
            break;
        case 6:
            t = (arg2 ^ 0xc6ad) + (arg2 >> 1);
            break;
        case 7:
            t = 0x55f6+ 5 * arg2;
            break;
    }
    values[1] = t;
    return write_answer(out, cap, values, count);
}

u32 p4_walk(u32 t, u32 low, u32 high, u32 mix) {
    u32 m = (high - low) / 2 + low;
    if (m == t) {
        return (m + 0xe0) ^ mix;
    }
    u32 b = m + mix;
    if (t >= m) {
        return (3 * p4_walk(t, m + 1, high, mix) ^ b) ^ 0x1a;
    }
    return (3 * p4_walk(t, low, m - 1, mix) ^ b) ^ 0x10;
}

int solve_phase_4(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 0;
    /* phase_04：一个整数
     *   在 [0, 0x7f] 里二分查找 challenge & 0x7f，
     *   mix = (challenge >> 7) ^ (challenge >> 32)，递归过程见 p4_walk。
     */
    count = 1;
    u32 a1 = challenge & 0x7f;
    u32 a4 = (u32)((challenge >> 7) ^ (challenge >> 32));
    values[0] = p4_walk(a1, 0, 0x7f, a4);
    return write_answer(out, cap, values, count);
}

int solve_phase_5(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 2;
    typedef struct {
        u32 a;
        u32 b;
        int next;
    } P5Node;

    /* 下标 = (节点地址 - 0x405ba0) / 16，对应 working.md 的 5.2 表 */
    static const P5Node p5_nodes[12] = {
        { 57768, 1546, 10 },   /* 0  405ba0 -> 405c40 */
        { 11580,    6,  8 },   /* 1  405bb0 -> 405c20 */
        { 15414, 2573,  1 },   /* 2  405bc0 -> 405bb0 */
        { 29357, 1079, 11 },   /* 3  405bd0 -> 405c50 */
        { 43503,  547,  6 },   /* 4  405be0 -> 405c00 */
        {  3634, 2942,  4 },   /* 5  405bf0 -> 405be0 */
        {  7142,  311, -1 },   /* 6  405c00 -> NULL   */
        { 22399, 1813,  9 },   /* 7  405c10 -> 405c30 */
        { 15422, 1342,  0 },   /* 8  405c20 -> 405ba0 */
        { 36474, 2421,  5 },   /* 9  405c30 -> 405bf0 */
        { 53647, 2107,  3 },   /* 10 405c40 -> 405bd0 */
        {  1933,  843,  7 },   /* 11 405c50 -> 405c10 */
    };

    /* 下标 = (head 地址 - 0x405ba0) / 16 */
    static const int p5_heads[8] = { 2, 1, 8, 0, 10, 3, 11, 7 };
    int t = (challenge >> 3) & 3;
    int node = p5_heads[challenge & 7];
    u32 result = ((((challenge >> 6) ^(challenge >> 32)) ^ p5_nodes[node].a) ^ 0x2511) + p5_nodes[node].b;
    for (int i = 0; i < t; i++) {
        node = p5_nodes[node].next;
        result ^= p5_nodes[node].a;
        result += p5_nodes[node].b;
    }
    values[0] = result;
    values[1] = p5_nodes[node].b;
    return write_answer(out, cap, values, count);
}

static u32 p6_op(int n, u32 x) {
    u32 ans = 0;
    switch (n) {
    case 0:
        ans = (x ^ 0xe1e9) + x * 2;
        break;
    case 1:
        ans = ((x << 7) | (x >> 25)) ^ 0x4e6c;
        break;
    case 2:
        ans = ((x >> 2) ^ x) + 0xa02a;
        break;
    case 3:
        ans = (0xae74+ 8*x) ^ (3*x);
        break;
    case 4:
        ans = (x+0xe3fc) ^ (x >> 7);
        break;
    case 5:
        ans = (x >> 7) | (x << 25);
        break;
    }
    return ans;
}

static int p6_convert(int i) {
    int n = 0;
    switch (i) {
    case 0:
    case 2:
        n = 3; break;
    case 1:
    case 5:
        n = 4; break;
    case 3:
        n = 2; break;
    case 4:
        n = 1; break;
    case 6:
        n = 0; break;
    case 7:
        n = 5; break;
    }
    return n;
}

int solve_phase_6(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 1;
    u32 t = (challenge >> 6) ^ (challenge >> 32);
    int index1 = challenge & 7;
    u32 result1 = p6_op(p6_convert(index1), t);
    u32 result2 = p6_op(p6_convert((challenge & 0x38) >> 3), result1 ^ 0x5354);
    values[0] = result2 + 0x91d5;
    return write_answer(out, cap, values, count);
}

int solve_secret(uint64_t challenge, uint64_t context, char *out, size_t cap) {
    u32 ans1 = context & 3;
    u32 a1 = (challenge >> 32) ^ (u32)challenge;
    u32 a2 = ((context >> 32) ^ (u32)context);
    u32 a = a1 ^ a2;
    u32 b = (0xb1d1 * ans1) ^ (u32)(context >> 16);
    u32 ans2 = ((((a << 7) | (a >> 25))+0xb1d1)^0x85fd) ^ b;
    u32 ans3 = ans2 ^ ((a2 + ans1 + 0x85fd) + (a1 >> 7));
    const char filler[33] = "0xxx4xxx8xxx12xx16xx20xx24xx28xx";  // 前缀不读入，只要长度32即可
    snprintf(out, cap, "%sOPEN %u %u %u", filler, ans1, ans2, ans3);
    return 0;
}
