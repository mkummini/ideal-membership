import data.mv_polynomial.basic
import data.mv_polynomial.comm_ring
import data.zmod.basic

open mv_polynomial
noncomputable theory

section 

abbreviation R := mv_polynomial (fin 6) (zmod 101)
def f : R  := (X 0)*(X 1)*(X 2) - (X 3)*(X 4)*(X 5)
def g : R  := (X 0)*(X 1)*(X 2)
def h : R  := (X 3)*(X 4)*(X 5)

#check R
#check f
#check g
#check h

lemma g_minus_h_eq_f : g - h = f := rfl

lemma g_eq_h_plus_f : g = h + f :=
begin
  rw [f, g, h],
  ring,
end

lemma g_eq_h_plus_f_one : g = (1:R)*h + (1:R)*f :=
begin
  rw [f, g, h],
  ring,
end
end
