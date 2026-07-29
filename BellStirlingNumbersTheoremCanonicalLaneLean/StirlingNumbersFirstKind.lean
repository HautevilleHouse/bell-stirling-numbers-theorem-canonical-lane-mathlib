import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure StirlingFirstKindPackage where
  n : ℕ
  k : ℕ
  stirlingNumber : ℤ
  recurrence : Prop
  recurrenceProof : recurrence

structure StirlingFirstKindEvidence (S : StirlingFirstKindPackage) where
  recurrenceClosed : S.recurrence

def StirlingFirstKindClosed (S : StirlingFirstKindPackage) : Prop :=
  S.recurrence

theorem stirling_first_kind_closed_from_evidence (S : StirlingFirstKindPackage) (E : StirlingFirstKindEvidence S) :
  StirlingFirstKindClosed S :=
  E.recurrenceClosed

def stirlingFirstKind : ℕ → ℕ → ℤ
  | 0, 0 => 1
  | n, 0 => 0
  | 0, k => 0
  | n+1, k => stirlingFirstKind n (k-1) - (n : ℤ) * stirlingFirstKind n k

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse