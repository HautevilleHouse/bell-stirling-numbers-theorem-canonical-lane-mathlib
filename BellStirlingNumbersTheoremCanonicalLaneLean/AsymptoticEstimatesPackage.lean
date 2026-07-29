import canonicalLaneMathlib.AdmissibleClass

/-!
# Asymptotic Estimates Package
-/

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure AsymptoticEstimatesPackage where
  bellNumberAsymptotic : Prop
  stirlingApproximation : Prop
  deBruijnFormula : Prop
  errorBound : Prop

structure AsymptoticEstimatesEvidence (A : AsymptoticEstimatesPackage) where
  bellNumberAsymptoticClosed : A.bellNumberAsymptotic
  stirlingApproximationClosed : A.stirlingApproximation
  deBruijnFormulaClosed : A.deBruijnFormula
  errorBoundClosed : A.errorBound

def AsymptoticEstimatesClosed (A : AsymptoticEstimatesPackage) : Prop :=
  A.bellNumberAsymptotic ∧ A.stirlingApproximation ∧ A.deBruijnFormula ∧ A.errorBound

theorem asymptotic_estimates_closed_from_evidence (A : AsymptoticEstimatesPackage) (E : AsymptoticEstimatesEvidence A) :
    AsymptoticEstimatesClosed A := by
  exact And.intro E.bellNumberAsymptoticClosed (And.intro E.stirlingApproximationClosed (And.intro E.deBruijnFormulaClosed E.errorBoundClosed))

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse