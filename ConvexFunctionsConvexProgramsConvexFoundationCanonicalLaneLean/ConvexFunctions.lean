import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexFunctionPackage where
  domain : Type u
  codomain : Type v
  f : domain → codomain
  convexSet : Set (domain × codomain)
  convexityProperty : Prop
  epigraphConvex : Prop

structure ConvexFunctionEvidence (P : ConvexFunctionPackage) where
  convexSetClosed : P.convexSet
  convexityPropertyClosed : P.convexityProperty
  epigraphConvexClosed : P.epigraphConvex

def ConvexFunctionClosed (P : ConvexFunctionPackage) : Prop :=
  P.convexSet ∧ P.convexityProperty ∧ P.epigraphConvex

theorem convex_function_closed_from_evidence (P : ConvexFunctionPackage)
    (E : ConvexFunctionEvidence P) : ConvexFunctionClosed P := by
  exact And.intro E.convexSetClosed
    (And.intro E.convexityPropertyClosed E.epigraphConvexClosed)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse