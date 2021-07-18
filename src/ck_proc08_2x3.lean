import data.mv_polynomial.basic
import data.mv_polynomial.comm_ring
import data.zmod.basic
import ring_theory.ideal.operations


open mv_polynomial
noncomputable theory

section
-- 2x3 case.

abbreviation R := mv_polynomial (fin 6) (zmod 101)
def f1 : R := (X 0)*(X 3)
def f2 : R  := (X 1)*(X 4)
def f3 : R  := (X 2)*(X 5)
def f4 : R  := (X 0)*(X 1)*(X 2) - (X 3)*(X 4)*(X 5)
def g : R  := (X 0)*(X 1)*(X 2)
def h : R  := (X 3)*(X 4)*(X 5)
--def I := ideal.span ({f1, f2, f3, f4} : set R)

lemma g_equiv_h : g = h + f4 :=
begin
  rw [f4, g, h],
  ring,
end

lemma g_times_var_zero_in_I : g*(X 0) = (X 4) * (X 5) * f1 + f4 * (X 0) :=
begin
  rw [g_equiv_h, h, f1, f4],
  ring,
end

lemma g_times_var_three_in_I : g*(X 3) = (X 1)*(X 2)*f1 :=
begin
  rw [g, f1],
  ring,
end

end