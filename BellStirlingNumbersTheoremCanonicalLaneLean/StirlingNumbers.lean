import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

noncomputable def stirlingFirst (n k : ℕ) : ℤ :=
  Finset.sum (Finset.range (n+1)) (λ i => (-1)^(n-k) * Finset.sum (Finset.range (i+1)) (λ j => ???) ) -- placeholder

noncomputable def stirlingSecond (n k : ℕ) : ℕ :=
  Finset.sum (Finset.range (k+1)) (λ i => ((-1)^(k-i) * (Nat.choose k i : ℕ) * i^n) / (k! : ℕ))

structure StirlingNumberPackage where
  stirlingFirst : ℕ → ℕ → ℤ
  stirlingSecond : ℕ → ℕ → ℕ
  recurrenceFirst : ∀ n k, stirlingFirst (n+1) k = stirlingFirst n (k-1) - (n : ℤ) * stirlingFirst n k
  recurrenceSecond : ∀ n k, stirlingSecond (n+1) k = stirlingSecond n (k-1) + (k : ℕ) * stirlingSecond n k
  orthogonality : Prop

structure StirlingNumberEvidence (P : StirlingNumberPackage) where
  recurrenceFirstClosed : P.recurrenceFirst
  recurrenceSecondClosed : P.recurrenceSecond
  orthogonalityClosed : P.orthogonality

def StirlingNumberClosed (P : StirlingNumberPackage) : Prop :=
  P.recurrenceFirst ∧ P.recurrenceSecond ∧ P.orthogonality

theorem stirling_number_closed_from_evidence (P : StirlingNumberPackage) (E : StirlingNumberEvidence P) :
    StirlingNumberClosed P := by
  exact And.intro E.recurrenceFirstClosed (And.intro E.recurrenceSecondClosed E.orthogonalityClosed)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse