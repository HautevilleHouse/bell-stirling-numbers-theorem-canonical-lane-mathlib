import BellStirlingNumbersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure AsymptoticEstimatePackage where
  bellNumberAsymptotic : ∀ n, BellNumber n = (1 / (Real.sqrt (2π) * Real.sqrt (Real.log n))) * (n / Real.log n)^n * (1 + o(1))
  errorBound : Prop
  bellNumberAsymptoticTerm : bellNumberAsymptotic
  errorBoundTerm : errorBound

structure AsymptoticEstimateEvidence (A : AsymptoticEstimatePackage) where
  bellNumberAsymptoticClosed : A.bellNumberAsymptotic
  errorBoundClosed : A.errorBound

def AsymptoticEstimateClosed (A : AsymptoticEstimatePackage) : Prop :=
  A.bellNumberAsymptotic ∧ A.errorBound

theorem asymptotic_estimate_closed_from_evidence (A : AsymptoticEstimatePackage) (E : AsymptoticEstimateEvidence A) :
  AsymptoticEstimateClosed A := by
  exact And.intro E.bellNumberAsymptoticClosed E.errorBoundClosed

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse