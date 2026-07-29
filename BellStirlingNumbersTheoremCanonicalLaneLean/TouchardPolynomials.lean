import BellStirlingNumbersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BellStirlingNumbersTheoremCanonicalLaneLean

structure TouchardPolynomial where
  n : ℕ
  polynomial : Polynomial ℚ

deriving Repr

structure TouchardPolynomialPackage where
  touchardPolynomials : ℕ → Polynomial ℚ
  explicitFormula : ∀ n, touchardPolynomials n = ∑ k in Finset.range (n+1), (StirlingNumbersSecondKind n k) * Polynomial.X ^ k
  exponentialGeneratingFunction : (∑' n, (touchardPolynomials n) * (Polynomial.X ^ n) / (n! : ℚ)) = exp (Polynomial.X * exp (Polynomial.X) - Polynomial.X)
  explicitFormulaTerm : explicitFormula
  exponentialGeneratingFunctionTerm : exponentialGeneratingFunction

structure TouchardPolynomialEvidence (T : TouchardPolynomialPackage) where
  explicitFormulaClosed : T.explicitFormula
  exponentialGeneratingFunctionClosed : T.exponentialGeneratingFunction

def TouchardPolynomialClosed (T : TouchardPolynomialPackage) : Prop :=
  T.explicitFormula ∧ T.exponentialGeneratingFunction

theorem touchard_polynomial_closed_from_evidence (T : TouchardPolynomialPackage) (E : TouchardPolynomialEvidence T) :
  TouchardPolynomialClosed T := by
  exact And.intro E.explicitFormulaClosed E.exponentialGeneratingFunctionClosed

end BellStirlingNumbersTheoremCanonicalLaneLean
end HautevilleHouse