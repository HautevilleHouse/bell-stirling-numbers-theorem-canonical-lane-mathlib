import BellStirlingNumbersTheoremCanonicalLaneLean.BellStirlingNumbers
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BellStirlingSpace where
  carrier : Type
  discreteTopology : TopologicalSpace carrier

structure BellStirlingAdmittedObjectWithMathlib where
  space : BellStirlingSpace
  finitePartition : Prop
  bellNumberConsistency : Prop
  conclusion : bellNumberConsistency

def BellStirlingWitnessClosedMathlib (O : BellStirlingAdmittedObjectWithMathlib) : Prop :=
  O.bellNumberConsistency

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse