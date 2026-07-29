import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure BellStirlingAdmittedObject where
  n : Nat
  bellNumber : Nat
  stirlingSecondKind : Nat
  partitionCount : Prop
  conclusion : partitionCount

def BellStirlingWitnessClosed (O : BellStirlingAdmittedObject) : Prop :=
  O.partitionCount

structure AdmissibleClass where
  object : BellStirlingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BellStirlingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse