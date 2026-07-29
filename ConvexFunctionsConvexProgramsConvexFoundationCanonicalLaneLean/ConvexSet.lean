import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexSet (V : Type) [AddCommMonoid V] [Module ℝ V] where
  carrier : Set V
  convex : ∀ (x y : V), x ∈ carrier → y ∈ carrier → ∀ (t : ℝ), 0 ≤ t → t ≤ 1 → (t • x + (1 - t) • y) ∈ carrier

def convexSetEvidence {V : Type} [AddCommMonoid V] [Module ℝ V] (C : ConvexSet V) : Prop :=
  C.convex

theorem convexSet_closure {V : Type} [AddCommMonoid V] [Module ℝ V] (C : ConvexSet V) : convexSetEvidence C :=
  C.convex

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse
