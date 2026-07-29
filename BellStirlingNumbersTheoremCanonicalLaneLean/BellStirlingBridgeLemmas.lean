import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BellStirlingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse