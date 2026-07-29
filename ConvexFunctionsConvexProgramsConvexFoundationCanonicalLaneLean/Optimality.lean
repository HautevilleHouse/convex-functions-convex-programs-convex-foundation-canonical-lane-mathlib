import canonicalLaneMathlib.AdmissibleClass
import ConvexProgram

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure OptimalSolution (V : Type) [AddCommMonoid V] [Module ℝ V] (P : ConvexProgram V) where
  point : V
  feasible : point ∈ P.feasibleSet.carrier
  optimal : ∀ (y : V), y ∈ P.feasibleSet.carrier → P.objective.f point ≤ P.objective.f y

structure OptimalityEvidence {V : Type} [AddCommMonoid V] [Module ℝ V] {P : ConvexProgram V} (O : OptimalSolution V P) where
  feasibleClosed : O.feasible
  optimalClosed : O.optimal

def OptimalityClosed {V : Type} [AddCommMonoid V] [Module ℝ V] {P : ConvexProgram V} (O : OptimalSolution V P) : Prop :=
  O.feasible ∧ O.optimal

theorem optimality_closed_from_evidence {V : Type} [AddCommMonoid V] [Module ℝ V] {P : ConvexProgram V} (O : OptimalSolution V P) (E : OptimalityEvidence O) : OptimalityClosed O :=
  And.intro E.feasibleClosed E.optimalClosed

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse
