import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure GradientDescent (f : ConvexFunction) where
  stepSize : ℕ → ℝ
  initialPoint : f.domain
  iterates : ℕ → f.domain
  updateRule : ∀ k : ℕ, iterates (k+1) = iterates k - stepSize k • gradient f (iterates k)

structure ConvergenceRate (f : ConvexFunction) (gd : GradientDescent f) where
  rate : ℕ → ℝ
  convergenceCondition : ∀ ε > 0, ∃ N : ℕ, ∀ k ≥ N, f.functionVal (gd.iterates k) - f.functionVal (OptimalSolution.feasible.point) < ε

def AlgorithmClosed (f : ConvexFunction) (gd : GradientDescent f) : Prop :=
  f.convexityProperty

theorem algorithm_closed_from_convergence (f : ConvexFunction) (gd : GradientDescent f) (cr : ConvergenceRate f gd) :
    AlgorithmClosed f gd :=
  cr.convergenceCondition 0.1 10

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse