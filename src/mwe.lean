import data.mv_polynomial.basic
import data.mv_polynomial.comm_ring
import data.zmod.basic

open mv_polynomial

abbreviation R := mv_polynomial (fin 2) (zmod 2)

example :
  let f : R :=  (X 0)^2 + (X 1)^2,
      f1 : R := X 0,
      f2 : R := X 1
      in
      f = (X 0) * f1 + (X 1) * f2 := 
begin
 ring_exp,
  --ring,
 -- ring_nf,
end