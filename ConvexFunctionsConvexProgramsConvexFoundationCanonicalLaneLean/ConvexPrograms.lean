import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.ConvexFunctions

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexProgramPackage where
  objective : ConvexFunctionPackage
  constraints : List (ConvexFunctionPackage × Real)
  feasibleSet : Set (objective.domain)
  optimalValue : Real
  optimalSolution : objective.domain
  strongDuality : Prop

structure ConvexProgramEvidence (P : ConvexProgramPackage) where
  feasibleSetClosed : P.feasibleSet
  objectiveMinimal : P.optimalValue = P.objective.f P.optimalSolution
  strongDualityClosed : P.strongDuality

def ConvexProgramClosed (P : ConvexProgramPackage) : Prop :=
  P.feasibleSet ∧ (P.optimalValue = P.objective.f P.optimalSolution) ∧ P.strongDuality

theorem convex_program_closed_from_evidence (P : ConvexProgramPackage)
    (E : ConvexProgramEvidence P) : ConvexProgramClosed P := by
  exact And.intro E.feasibleSetClosed
    (And.intro E.objectiveMinimal E.strongDualityClosed)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse