import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

noncomputable def exponentialGeneratingFunction (a : ℕ → ℕ) : PowerSeries ℚ :=
  PowerSeries.mk (λ n => (a n : ℚ) / (Nat.factorial n : ℚ))

structure GeneratingFunctionPackage where
  bellEGF : PowerSeries ℚ
  stirlingEGF : ℕ → ℕ → PowerSeries ℚ
  bellEGFequation : bellEGF = PowerSeries.exp (PowerSeries.exp (0 : PowerSeries ℚ) - 1) -- placeholder, exp(exp(x)-1)
  stirlingEGFequation : ∀ k, stirlingEGF k = some expression

structure GeneratingFunctionEvidence (P : GeneratingFunctionPackage) where
  bellEGFequationClosed : P.bellEGFequation
  stirlingEGFequationClosed : ∀ k, P.stirlingEGFequation k

def GeneratingFunctionClosed (P : GeneratingFunctionPackage) : Prop :=
  P.bellEGFequation ∧ (∀ k, P.stirlingEGFequation k)

theorem generating_function_closed_from_evidence (P : GeneratingFunctionPackage) (E : GeneratingFunctionEvidence P) :
    GeneratingFunctionClosed P := by
  exact And.intro E.bellEGFequationClosed E.stirlingEGFequationClosed

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse