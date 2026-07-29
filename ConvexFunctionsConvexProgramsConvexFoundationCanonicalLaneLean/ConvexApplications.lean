import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure LinearProgram (P : ConvexProgram) where
  linearObjective : AffineFunction P.objective
  linearConstraints : List (AffineFunction P.objective)
  linearDomain : Set P.decisionSpace

def LinearProgramClosed (LP : LinearProgram P) : Prop :=
  LP.linearDomain ≠ ∅

theorem linear_program_closed (LP : LinearProgram P) (f : FeasiblePoint P) :
    LinearProgramClosed LP :=
  by
    have h : LP.linearDomain ≠ ∅ := Set.nonempty_iff_ne_empty.mpr ⟨f.point, f.inDomain⟩
    exact h

structure QuadraticProgram (P : ConvexProgram) where
  quadraticObjective : ConvexFunction
  convexQuadratic : ConvexityCondition quadraticObjective
  linearConstraints : List (AffineFunction quadraticObjective)

def QuadraticProgramClosed (QP : QuadraticProgram P) : Prop :=
  QP.convexQuadratic.isConvex 0 1 0.5

theorem quadratic_program_closed (QP : QuadraticProgram P) : QuadraticProgramClosed QP :=
  QP.convexQuadratic.isConvex 0 1 0.5

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse