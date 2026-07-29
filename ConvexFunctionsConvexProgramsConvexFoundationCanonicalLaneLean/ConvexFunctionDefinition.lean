import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure Domain (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  carrier : Set E
  nonempty : carrier.Nonempty
  convex : Convex ℝ carrier

structure ConvexFunction (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (D : Domain E) where
  toFun : D.carrier → ℝ
  convex : ConvexOn ℝ D.carrier toFun
  lowerSemicontinuous : LowerSemicontinuousOn toFun D.carrier

def ConvexFunction.effectiveDomain {E : Type u} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {D : Domain E} (f : ConvexFunction E D) : Set E :=
  { x ∈ D.carrier | f.toFun ⟨x, Set.mem_of_mem_of_subset ?_ ?_⟩ < ∞ }
  -- Placeholder; actual construction uses proper extension.
  sorry

structure Epigraph (E : Type u) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (D : Domain E) (f : ConvexFunction E D) where
  carrier : Set (E × ℝ)
  convex : Convex ℝ carrier
  epigraphMatches : carrier = { p | p.1 ∈ D.carrier ∧ f.toFun ⟨p.1, by sorry⟩ ≤ p.2 }

theorem convex_iff_epigraph_convex {E : Type u} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {D : Domain E} (f : ConvexFunction E D) :
    Convex ℝ (Epigraph.carrier D f) := f.epigraph.convex

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse