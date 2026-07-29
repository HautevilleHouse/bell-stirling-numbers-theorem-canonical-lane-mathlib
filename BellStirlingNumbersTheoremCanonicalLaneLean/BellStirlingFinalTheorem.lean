import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

def ConstrainedBellStirlingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bell_stirling_endgame (A : AdmissibleClass) :
    ConstrainedBellStirlingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse