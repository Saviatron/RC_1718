natural(1).
natural(N):- N > 1, N2 is N - 1, natural(N2). %natural(n-1)->natural(n)