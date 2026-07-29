import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure BellStirlingAdmittedObject where
  n : ℕ
  bellNumber : ℕ
  stirlingNumbers : ℕ → ℕ → ℕ
  sumFormula : bellNumber = Finset.sum (Finset.range (n+1)) (fun k => stirlingNumbers n k)
  conclusion : sumFormula

def admittedClosure (A : BellStirlingAdmittedObject) : Prop :=
  A.conclusion

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse