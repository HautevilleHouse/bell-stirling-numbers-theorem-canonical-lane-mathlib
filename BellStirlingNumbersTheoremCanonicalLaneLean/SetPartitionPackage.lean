import canonicalLaneMathlib.AdmissibleClass

/-!
# Set Partition Package
-/

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure SetPartitionPackage where
  n : Nat
  numberPartitions : Nat
  recurrenceRelation : Prop
  explicitFormula : Prop
  generatingFunction : Prop

structure SetPartitionEvidence (S : SetPartitionPackage) where
  recurrenceRelationClosed : S.recurrenceRelation
  explicitFormulaClosed : S.explicitFormula
  generatingFunctionClosed : S.generatingFunction

def SetPartitionClosed (S : SetPartitionPackage) : Prop :=
  S.recurrenceRelation ∧ S.explicitFormula ∧ S.generatingFunction

theorem set_partition_closed_from_evidence (S : SetPartitionPackage) (E : SetPartitionEvidence S) :
    SetPartitionClosed S := by
  exact And.intro E.recurrenceRelationClosed (And.intro E.explicitFormulaClosed E.generatingFunctionClosed)

def BellNumberRecurrence {n : Nat} : Prop :=
  ∀ m : Nat, m ≤ n → (BellNumberRecurrence m) := by
  intro m hm
  exact False.elim (Nat.not_lt.mpr hm (Nat.lt_succ_self m))

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse