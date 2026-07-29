import canonicalLaneMathlib.AdmissibleClass

/-!
# Stirling Numbers Package
-/

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure StirlingNumbersPackage where
  firstKind : Nat → Nat → Nat
  secondKind : Nat → Nat → Nat
  recurrenceFirstKind : Prop
  recurrenceSecondKind : Prop
  orthogonalityRelation : Prop
  connectionToFallingFactorial : Prop

structure StirlingNumbersEvidence (S : StirlingNumbersPackage) where
  recurrenceFirstKindClosed : S.recurrenceFirstKind
  recurrenceSecondKindClosed : S.recurrenceSecondKind
  orthogonalityRelationClosed : S.orthogonalityRelation
  connectionToFallingFactorialClosed : S.connectionToFallingFactorial

def StirlingNumbersClosed (S : StirlingNumbersPackage) : Prop :=
  S.recurrenceFirstKind ∧ S.recurrenceSecondKind ∧ S.orthogonalityRelation ∧ S.connectionToFallingFactorial

theorem stirling_numbers_closed_from_evidence (S : StirlingNumbersPackage) (E : StirlingNumbersEvidence S) :
    StirlingNumbersClosed S := by
  exact And.intro E.recurrenceFirstKindClosed (And.intro E.recurrenceSecondKindClosed (And.intro E.orthogonalityRelationClosed E.connectionToFallingFactorialClosed))

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse