import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexProgram where
  decisionSpace : Type u
  objective : ConvexFunction
  inequalityConstraints : List ConvexFunction
  equalityConstraints : List (AffineFunction objective)
  convexDomain : Set decisionSpace

structure FeasiblePoint (P : ConvexProgram) where
  point : P.decisionSpace
  inDomain : point ∈ P.convexDomain
  inequalityFeasible : ∀ f ∈ P.inequalityConstraints, f.functionVal point ≤ 0
  equalityFeasible : ∀ g ∈ P.equalityConstraints, g.affineEquality point = 0

structure OptimalSolution (P : ConvexProgram) where
  feasible : FeasiblePoint P
  optimalValue : ℝ
  optimalityCondition : ∀ other : FeasiblePoint P,
    P.objective.functionVal feasible.point ≤ P.objective.functionVal other.point

def ConvexProgramClosed (P : ConvexProgram) : Prop :=
  P.convexDomain ≠ ∅

theorem convex_program_closed_from_feasibility (P : ConvexProgram) (f : FeasiblePoint P) :
    ConvexProgramClosed P :=
  by
    have h : P.convexDomain ≠ ∅ := Set.nonempty_iff_ne_empty.mpr ⟨f.point, f.inDomain⟩
    exact h

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse