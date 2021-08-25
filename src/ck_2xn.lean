import data.mv_polynomial.basic
import data.mv_polynomial.comm_ring
import data.zmod.basic
import ring_theory.ideal.operations


open mv_polynomial
open_locale big_operators
noncomputable theory

section
-- trying to work with a 2xn matrix.

parameter n : ℕ
abbreviation R := mv_polynomial (zmod (2*n)) (zmod 101)
-- abbreviation R := mv_polynomial (fin n ⊕ fin n) (zmod 101)
#check R

def f : (zmod (2*n)) → R := λ i, (X i)*(X (i+n))
-- def f : fin n ⊕ fin n → R := λ i, (X i)*(X (sum.swap i))

#check f
#check f 0

def g1 := ∏ r (X 0)*(X 1)*(X 2)

end


section
-- column sum of a 4x4 matrix of variables 
def S1 := mv_polynomial (zmod 4 × zmod 4) (zmod 101)
def h1 : zmod 4 → S1 := λ i, ∑ j in (zmod 4), X (i, j)
-- unexpected token
#check S1

#check h1
-- unknown identifier "h"
end

section
-- column sum of an nxn matrix of variables  using zmod

parameter n : ℕ

abbreviation S := mv_polynomial (zmod n × zmod n) (zmod 101)
#check S
-- OK.

def h : zmod n →  zmod n → S := λ i, λ j, X (i,j)
#check h
-- OK 
#check h 3
-- zmod n → S. OK.

-- specific column
def h3 := h 3
#check h3

-- arbitrary column
parameter i : zmod n
def hi := h i
#check hi

def g3 := ∑ j in zmod n, h3
def gi : zmod n → S := ∑ j in zmod n, hi 

#check gi
#check g3

def s := finset (zmod n)
#check s
#check finset.sum  
#check finset.sum s 
#check finset.sum s g3

#check s
def g : S := ∑ j in s, g3
#check zmod
#check zmod 4
#check zmod n


--λ i, ∑ j in zmod n, (h i)

--∑ j in zmod n, X (i,j)
-- unexpected token at ∑ 
#check h
-- unknown identifier "h"

end


section
-- column sum of an nxn matrix of variables  using fin

parameter n : ℕ

abbreviation S2 := mv_polynomial (fin n × fin n) (zmod 101)
#check S
-- OK.

def h : fin n → S2 := λ i, ∑  j in fin n X (i,j)
-- unexpected token at ∑ 
#check h
-- unknown identifier "h"

end




section
-- trial-and-error type checking

variables n : nat
variables a : fin n
#check fin
#check fin n
#check fin n ⊕ fin n


end

section
-- from p. 99 of Theorem proving in Lean.

def sum_example (s : nat ⊕ nat) : nat :=
  sum.cases_on s (λ n, 2 * n) (λ n, 2 * n + 1)
#reduce ((sum.inl 3), (sum.inr 4)) 
#reduce sum_example (sum.inl 3)
#reduce sum_example (sum.inr 3)

#check nat × nat 
end