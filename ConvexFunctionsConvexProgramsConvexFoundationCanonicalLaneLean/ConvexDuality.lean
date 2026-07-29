import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure FenchelConjugate (f : ConvexFunction) where
  conjugateFunction : f.codomain → ℝ
  conjugateDef : ∀ y : f.codomain, conjugateFunction y = sup (λ x : f.domain => y * f.functionVal x - f.functionVal x)

structure Lagrangian (P : ConvexProgram) where
  multiplierSpace : Type v
  lagrangianFunction : P.decisionSpace → multiplierSpace → ℝ
  lagrangianDef : ∀ (x : P.decisionSpace) (λ : multiplierSpace), lagrangianFunction x λ =
    P.objective.functionVal x + ∑ f in P.inequalityConstraints, λ * f.functionVal x

structure DualProgram (P : ConvexProgram) (L : Lagrangian P) where
  dualVariable : L.multiplierSpace
  dualObjective : ℝ
  dualFeasibility : ∀ f : P.inequalityConstraints, dualVariable ≥ 0

def DualityGapClosed (P : ConvexProgram) (D : DualProgram P) (L : Lagrangian P) : Prop :=
  P.objective.functionVal (OptimalSolution P).feasible.point = D.dualObjective

theorem duality_gap_closed_from_strong_duality (P : ConvexProgram) (D : DualProgram P) (L : Lagrangian P) :
    DualityGapClosed P D L :=
  by
    -- Strong duality holds under convexity and constraint qualification
    sorry

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse