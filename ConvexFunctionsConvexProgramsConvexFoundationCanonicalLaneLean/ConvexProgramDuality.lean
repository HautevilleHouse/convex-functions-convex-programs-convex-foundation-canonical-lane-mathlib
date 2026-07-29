import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure PrimalProgram (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (X : Domain E) (f : ConvexFunction E X) (g : ConvexFunction E X) where
  objective : ConvexFunction E X
  constraints : Set (ConvexFunction E X)
  feasibilityCondition : Prop

structure DualVariable (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  multiplier : ℝ
  slack : E

structure LagrangeMultiplier (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (X : Domain E) where
  multiplier : ℝ
  feasibility : Prop

def Lagrangian (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (X : Domain E) (f : ConvexFunction E X) (g : ConvexFunction E X)
    (x : X.carrier) (y : ℝ) (z : E) : ℝ :=
  f.toFun ⟨x, by trivial⟩ + y • g.toFun ⟨x, by trivial⟩ + inner z x

theorem weak_duality {E : Type u} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (X : Domain E) (f : ConvexFunction E X) (g : ConvexFunction E X) :
    (∀ x, f.toFun ⟨x, by trivial⟩ ≥ 0) := by
  intro
  sorry

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse