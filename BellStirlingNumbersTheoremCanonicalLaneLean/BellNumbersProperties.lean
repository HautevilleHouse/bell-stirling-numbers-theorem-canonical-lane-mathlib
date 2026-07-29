import BellStirlingNumbersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure BellNumber where
  n : ℕ
  value : ℕ
deriving Repr

structure BellNumberPackage where
  bellNumbers : ℕ → ℕ
  formulaWithStirling : ∀ n, bellNumbers n = ∑ k in Finset.range (n+1), StirlingNumbersSecondKind n k
  recurrenceRelation : ∀ n, 0 < n → bellNumbers n = ∑ k in Finset.range n, (Nat.choose (n-1) k) * bellNumbers k
  initialValue : bellNumbers 0 = 1
  formulaWithStirlingTerm : formulaWithStirling
  recurrenceRelationTerm : recurrenceRelation
  initialValueTerm : initialValue

structure BellNumberEvidence (B : BellNumberPackage) where
  formulaWithStirlingClosed : B.formulaWithStirling
  recurrenceRelationClosed : B.recurrenceRelation
  initialValueClosed : B.initialValue

def BellNumberClosed (B : BellNumberPackage) : Prop :=
  B.formulaWithStirling ∧ B.recurrenceRelation ∧ B.initialValue

theorem bell_number_closed_from_evidence (B : BellNumberPackage) (E : BellNumberEvidence B) :
  BellNumberClosed B := by
  exact And.intro E.formulaWithStirlingClosed (And.intro E.recurrenceRelationClosed E.initialValueClosed)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse