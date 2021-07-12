# lean
Attempts to use lean for proof-checking ideal membership in polynomial
rings.

Problem: Let $R$ be a polynomial ring over a field, $I$ an $R$-ideal and
$f \in R$. We want to proof-check the statement $f \in I$ using
lean/mathlib.

Approach:

1. Generate a Grobner basis $\{g_1, \ldots, g_m\}$ for $I$ and an
   expression  $f = \sum_{i=1}^m r_i g_i$ where the $r_i$ are elements
   of $R$. This is done with an external program like 
   Macaulay2 <https://faculty.math.illinois.edu/Macaulay2/>.

2. Prove that $f = \sum_{i=1}^m r_i g_i$ in mathlib.
