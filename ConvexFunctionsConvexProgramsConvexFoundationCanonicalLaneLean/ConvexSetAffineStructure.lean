import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexSet (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  carrier : Set E
  convex : Convex ℝ carrier

structure ConvexCone (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  carrier : Set E
  convexCone : ConvexCone ℝ carrier

structure AffineSubspace (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  carrier : Set E
  affineSubspace : AffineSubspace ℝ E

def PointwiseProductConvex (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (A B : ConvexSet E) : ConvexSet E :=
  { carrier := { z | ∃ (x ∈ A.carrier) (y ∈ B.carrier), z = x + y }
    convex := by
      intro x hx y hy a b ha hb hab
      rcases ⟨hx, hy⟩ with ⟨⟨xa, hxa, xb, hxb, hx_eq⟩, ya, hya, yb, hyb, hy_eq⟩
      refine ⟨a•xa + b•ya, ?_, a•xb + b•yb, ?_, ?_⟩
      · apply A.convex hxa hya ha hb hab
      · apply B.convex hxb hyb ha hb hab
      · calc
          a • (xa + xb) + b • (ya + yb) = (a•xa + a•xb) + (b•ya + b•yb) := by ring
          _ = (a•xa + b•ya) + (a•xb + b•yb) := by ring
          _ = a•xa + b•ya + (a•xb + b•yb) := rfl
        exact congrArg (fun t => t + (a•xb + b•yb)) (hx_eq.symm ▸ hy_eq.symm ▸ rfl) }

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse