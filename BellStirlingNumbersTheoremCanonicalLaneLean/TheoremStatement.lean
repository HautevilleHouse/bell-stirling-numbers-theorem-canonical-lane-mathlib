import HautevilleHouse.BellStirlingNumbersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  bellStirlingSpecificStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "bell-stirling-numbers-theorem",
  theoremName := "Bell Stirling Numbers Theorem",
  theoremObject := "Bell and Stirling numbers identities",
  classicalBoundary := "classical combinatorial identities",
  bellStirlingSpecificStatement := "Bell numbers and Stirling numbers of the second kind satisfy the identity B_n = sum_{k=0}^n S(n,k)",
  certificateLane := "manifold_constrained",
  carriedRemainder := "classical source boundary carried by formalization"
}

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse