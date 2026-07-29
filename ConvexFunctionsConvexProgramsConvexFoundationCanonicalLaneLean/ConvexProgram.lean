import canonicalLaneMathlib.AdmissibleClass
import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.ConvexFunction

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexProgramPackage (F : ConvexFunctionPackage) where
  objectiveFunction : ConvexFunctionPackage
  inequalityConstraints : List (ConvexFunctionPackage × ℝ)
  equalityConstraints : List (ConvexFunctionPackage × ℝ)
  feasibleSet : Prop
  optimalValue : ℝ
  strongDualityHolds : Prop

def ConvexProgramClosed {F : ConvexFunctionPackage} (P : ConvexProgramPackage F) : Prop :=
  P.feasibleSet ∧ P.strongDualityHolds

structure ConvexProgramEvidence {F : ConvexFunctionPackage} (P : ConvexProgramPackage F) where
  feasibleSetClosed : P.feasibleSet
  strongDualityHoldsClosed : P.strongDualityHolds

theorem convex_program_closed_from_evidence {F : ConvexFunctionPackage} (P : ConvexProgramPackage F) (E : ConvexProgramEvidence P) :
  ConvexProgramClosed P := by
  exact And.intro E.feasibleSetClosed E.strongDualityHoldsClosed

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse