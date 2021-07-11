import data.mv_polynomial.basic
import data.mv_polynomial.comm_ring
import data.zmod.basic

open mv_polynomial
--noncomputable theory

section 

abbreviation R := mv_polynomial (fin 6) (zmod 101)
abbreviation f : R  := (X 0)*(X 1)*(X 2) - (X 3)*(X 4)*(X 5)
abbreviation g : R  := (X 0)*(X 1)*(X 2)
abbreviation h : R  := (X 3)*(X 4)*(X 5)
-- local notation h : R  := (X 3)*(X 4)*(X 5)

#check R
#check f
#check g
#check h

lemma g_minus_h_eq_f : g - h = f :=
begin
  -- ring_exp,
  ring,
end
-- gives deterministic timeout (whether or not 'noncomputable theory' is used.)
-- with local notation gives "unknown identifier 'h'"
-- ring_exp only rewrites it as g + (-h)

#check g_minus_h_eq_f 
   -- g - h = f
   -- correctly

lemma g_eq_h_plus_f : g = h + f :=
begin
  ring,
end
-- gives deterministic timeout

lemma g_eq_h_plus_f_one : g = (1:R)*h + (1:R)*f :=
begin
  ring_exp,
end
-- tactic failed.


end

section 
-- 2x3 case.

abbreviation R := mv_polynomial (fin 6) (zmod 101)
local notation f1 : R := (X 0)*(X 3)
local notation f2 : R  := (X 1)*(X 4)
local notation f3 : R  := (X 2)*(X 5)
abbreviation f4 : R  := (X 0)*(X 1)*(X 2) - (X 3)*(X 4)*(X 5)
abbreviation g : R  := (X 0)*(X 1)*(X 2)
abbreviation h : R  := (X 3)*(X 4)*(X 5)

lemma g_equiv_h : g = h + f4 :=
begin
  ring,

end

end two_by_three
end