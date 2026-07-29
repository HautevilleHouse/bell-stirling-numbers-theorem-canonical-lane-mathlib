import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BellStirlingNumbersTheoremCanonicalLaneLean.StirlingNumbersSecondKind

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure BellNumbers (St : StirlingNumbersSecondKind) where
  B : ℕ → ℕ
  sumFormula : ∀ n, B n = Finset.sum (Finset.range (n+1)) (fun k => St.S n k)
  recurrence : ∀ n, 0 < n → B n = Finset.sum (Finset.range n) (fun k => Nat.choose (n-1) k * B k)
  B0 : B 0 = 1

structure BellEvidence (St : StirlingNumbersSecondKind) (Bn : BellNumbers St) where
  sumFormula_closed : ∀ n, Bn.B n = Finset.sum (Finset.range (n+1)) (fun k => St.S n k)
  recurrence_closed : ∀ n, 0 < n → Bn.B n = Finset.sum (Finset.range n) (fun k => Nat.choose (n-1) k * Bn.B k)
  B0_closed : Bn.B 0 = 1

def BellNumbersClosed (St : StirlingNumbersSecondKind) (Bn : BellNumbers St) : Prop :=
  (∀ n, Bn.B n = Finset.sum (Finset.range (n+1)) (fun k => St.S n k)) ∧
  (∀ n, 0 < n → Bn.B n = Finset.sum (Finset.range n) (fun k => Nat.choose (n-1) k * Bn.B k)) ∧
  Bn.B 0 = 1

theorem bell_closed_from_evidence (St : StirlingNumbersSecondKind) (Bn : BellNumbers St) (E : BellEvidence St Bn) :
    BellNumbersClosed St Bn := by
  exact And.intro E.sumFormula_closed (And.intro E.recurrence_closed E.B0_closed)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse