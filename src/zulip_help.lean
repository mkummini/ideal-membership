-- help from zulip chat
import data.mv_polynomial.basic
import data.mv_polynomial.comm_ring
import data.zmod.basic
import ring_theory.ideal.operations


open mv_polynomial
open_locale big_operators
noncomputable theory

section
-- trying to work with a mxn matrix.

parameter m : ℕ
parameter n : ℕ
abbreviation rows := (fin m)
abbreviation cols := (fin n)

abbreviation R := mv_polynomial ( rows × cols ) (zmod 101)
#print R

def entries : matrix rows cols R := λ i, λ j, X (i,j)
variable  i: rows
-- variable  j: cols
#check entries
#check entries i

#check cols

def row_prod (i : rows) : R := ∏ j, entries i j

#print row_prod
#check row_prod i 

end
-- we can even do some "computation" to check everything makes sense


#simp [row_prod, entries] row_prod 2 2 1
#simp [row_prod, entries, fin.prod_univ_succ] row_prod 2 2 1


#simp [row_prod, entries] row_prod 4 5 1
#simp [row_prod, entries] row_prod 5 4 1
