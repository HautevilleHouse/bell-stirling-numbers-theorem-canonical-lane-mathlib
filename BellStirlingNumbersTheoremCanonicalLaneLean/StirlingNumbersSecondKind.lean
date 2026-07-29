import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Nat.Basic

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure StirlingNumbersSecondKind where
  S : ℕ → ℕ → ℕ
  recurrence : ∀ n k, 0 < k → k < n → S n k = S (n-1) (k-1) + k * S (n-1) k
  boundary_k0 : ∀ n, S n 0 = if n = 0 then 1 else 0
  boundary_kn : ∀ n, S n n = 1
  boundary_k1 : ∀ n, 0 < n → S n 1 = 1

structure StirlingEvidence (St : StirlingNumbersSecondKind) where
  recurrence_closed : ∀ n k, 0 < k → k < n → St.S n k = St.S (n-1) (k-1) + k * St.S (n-1) k
  boundary_k0_closed : ∀ n, St.S n 0 = if n = 0 then 1 else 0
  boundary_kn_closed : ∀ n, St.S n n = 1
  boundary_k1_closed : ∀ n, 0 < n → St.S n 1 = 1

def StirlingNumbersSecondKindClosed (St : StirlingNumbersSecondKind) : Prop :=
  (∀ n k, 0 < k → k < n → St.S n k = St.S (n-1) (k-1) + k * St.S (n-1) k) ∧
  (∀ n, St.S n 0 = if n = 0 then 1 else 0) ∧
  (∀ n, St.S n n = 1) ∧
  (∀ n, 0 < n → St.S n 1 = 1)

theorem stirling_closed_from_evidence (St : StirlingNumbersSecondKind) (E : StirlingEvidence St) :
    StirlingNumbersSecondKindClosed St := by
  exact And.intro E.recurrence_closed (And.intro E.boundary_k0_closed (And.intro E.boundary_kn_closed E.boundary_k1_closed))

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse