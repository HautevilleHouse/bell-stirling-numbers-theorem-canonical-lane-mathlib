import BellStirlingNumbersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure StirlingNumbersFirstKind where
  n : ℕ
  k : ℕ
  value : ℕ
delderiving Repr

structure StirlingNumbersSecondKind where
  n : ℕ
  k : ℕ
  value : ℕ
deriving Repr

structure StirlingRecurrencePackage where
  firstKindRecurrence : ∀ n k, 0 < k → k < n → StirlingNumbersFirstKind n k = StirlingNumbersFirstKind (n-1) (k-1) + (n-1) * StirlingNumbersFirstKind (n-1) k
  secondKindRecurrence : ∀ n k, 0 < k → k < n → StirlingNumbersSecondKind n k = StirlingNumbersSecondKind (n-1) (k-1) + k * StirlingNumbersSecondKind (n-1) k
  initialConditions : Prop
  initialConditionsTerm : initialConditions

structure StirlingRecurrenceEvidence (P : StirlingRecurrencePackage) where
  firstKindRecurrenceClosed : P.firstKindRecurrence
  secondKindRecurrenceClosed : P.secondKindRecurrence
  initialConditionsClosed : P.initialConditions

def StirlingRecurrenceClosed (P : StirlingRecurrencePackage) : Prop :=
  P.firstKindRecurrence ∧ P.secondKindRecurrence ∧ P.initialConditions

theorem stirling_recurrence_closed_from_evidence (P : StirlingRecurrencePackage) (E : StirlingRecurrenceEvidence P) :
  StirlingRecurrenceClosed P := by
  exact And.intro E.firstKindRecurrenceClosed (And.intro E.secondKindRecurrenceClosed E.initialConditionsClosed)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse