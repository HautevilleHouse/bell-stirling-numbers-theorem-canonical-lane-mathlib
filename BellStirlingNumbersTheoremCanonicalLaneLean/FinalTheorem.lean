import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BellStirlingNumbersTheoremCanonicalLaneLean.StirlingNumbersSecondKind
import HautevilleHouse.BellStirlingNumbersTheoremCanonicalLaneLean.BellNumbers

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

def bridgeClosed (St : StirlingNumbersSecondKind) : Prop :=
  StirlingNumbersSecondKindClosed St

def gateClosed (St : StirlingNumbersSecondKind) (Bn : BellNumbers St) : Prop :=
  BellNumbersClosed St Bn

def ConstrainedBellStirlingClosure (St : StirlingNumbersSecondKind) (Bn : BellNumbers St) : Prop :=
  bridgeClosed St ∧ gateClosed St Bn

theorem constrained_bell_stirling_endgame (St : StirlingNumbersSecondKind) (Bn : BellNumbers St) (ESt : StirlingEvidence St) (EBn : BellEvidence St Bn) :
    ConstrainedBellStirlingClosure St Bn := by
  have hbridge : bridgeClosed St := stirling_closed_from_evidence St ESt
  have hgate : gateClosed St Bn := bell_closed_from_evidence St Bn EBn
  exact And.intro hbridge hgate

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse