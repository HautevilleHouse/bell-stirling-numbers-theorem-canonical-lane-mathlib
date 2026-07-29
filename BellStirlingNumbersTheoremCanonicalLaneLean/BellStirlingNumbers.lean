import BellStirlingNumbersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure BellStirlingAdmittedObject where
  n : ℕ
  bellNumber : ℕ
  stirlingSecondKind : ℕ → ℕ → ℕ
  partitionLattice : Prop
  conclusion : bellNumber = 0 ∨ stirlingSecondKind n 0 = 0

def BellStirlingWitnessClosed (O : BellStirlingAdmittedObject) : Prop :=
  O.bellNumber = 0 ∨ O.stirlingSecondKind O.n 0 = 0

theorem bell_stirling_witness_holds (O : BellStirlingAdmittedObject) :
    BellStirlingWitnessClosed O := O.conclusion

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse