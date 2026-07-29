import canonicalLaneMathlib.AdmissibleClass
import ConvexProgram

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure LagrangeDuality (V : Type) [AddCommMonoid V] [Module ℝ V] (P : ConvexProgram V) where
  Lagrangian : V → ℝ → ℝ -- placeholder: proper type
  dualFunction : ℝ → ℝ
  weakDuality : ∀ (x : V), x ∈ P.feasibleSet.carrier → ∀ (λ : ℝ), 0 ≤ λ → P.objective.f x ≥ dualFunction λ
  strongDuality : Exists (λ : ℝ), (0 ≤ λ) ∧ (∀ (x : V), x ∈ P.feasibleSet.carrier → P.objective.f x = dualFunction λ)

structure DualityEvidence {V : Type} [AddCommMonoid V] [Module ℝ V] {P : ConvexProgram V} (D : LagrangeDuality V P) where
  weakDualityClosed : D.weakDuality
  strongDualityClosed : D.strongDuality

def DualityClosed {V : Type} [AddCommMonoid V] [Module ℝ V] {P : ConvexProgram V} (D : LagrangeDuality V P) : Prop :=
  D.weakDuality ∧ D.strongDuality

theorem duality_closed_from_evidence {V : Type} [AddCommMonoid V] [Module ℝ V] {P : ConvexProgram V} (D : LagrangeDuality V P) (E : DualityEvidence D) : DualityClosed D :=
  And.intro E.weakDualityClosed E.strongDualityClosed

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse
