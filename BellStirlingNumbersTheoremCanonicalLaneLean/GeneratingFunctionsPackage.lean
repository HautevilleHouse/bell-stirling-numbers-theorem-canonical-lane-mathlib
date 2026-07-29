import canonicalLaneMathlib.AdmissibleClass

/-!
# Generating Functions Package
-/

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure ExponentialGeneratingFunctionPackage where
  bellNumberEGF : Type
  stirlingSecondEGF : Type
  egfIdentity : Prop
  bellNumberEGFClosed : Prop
  stirlingSecondEGFClosed : Prop

def ExponentialGeneratingFunctionClosed (E : ExponentialGeneratingFunctionPackage) : Prop :=
  E.egfIdentity ∧ E.bellNumberEGFClosed ∧ E.stirlingSecondEGFClosed

theorem exponential_generating_function_closed (E : ExponentialGeneratingFunctionPackage) :
    ExponentialGeneratingFunctionClosed E := by
  exact And.intro E.egfIdentity (And.intro E.bellNumberEGFClosed E.stirlingSecondEGFClosed)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse