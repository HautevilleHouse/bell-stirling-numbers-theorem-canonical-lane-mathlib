import HautevilleHouse.BellStirlingNumbersTheoremCanonicalLaneLean.BellNumbers
import HautevilleHouse.BellStirlingNumbersTheoremCanonicalLaneLean.StirlingNumbers

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

theorem bell_via_stirling (n : ℕ) : bellNumber n = ∑ k in Finset.range (n+1), stirlingSecond n k := by
  rfl

structure BellStirlingIdentityPackage where
  bellStirlingFormula : ∀ n, bellNumber n = ∑ k in Finset.range (n+1), stirlingSecond n k
  dobsinskiFormula : ∀ n, bellNumber n = (1 / Real.exp 1) * ∑ k : ℕ, (k ^ n) / (k.factorial : ℝ)

def BellStirlingIdentityEvidence (P : BellStirlingIdentityPackage) : Prop :=
  P.bellStirlingFormula ∧ P.dobsinskiFormula

def BellStirlingIdentityClosed (P : BellStirlingIdentityPackage) : Prop :=
  P.bellStirlingFormula ∧ P.dobsinskiFormula

theorem bell_stirling_identity_closed (P : BellStirlingIdentityPackage) (E : BellStirlingIdentityEvidence P) :
    BellStirlingIdentityClosed P := by
  exact And.intro E.1 E.2

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse