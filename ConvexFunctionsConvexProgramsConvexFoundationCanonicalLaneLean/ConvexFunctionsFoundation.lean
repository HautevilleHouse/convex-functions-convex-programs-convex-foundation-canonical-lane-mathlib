import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexFunction where
  domain : Type u
  codomain : Type v
  functionVal : domain → codomain
  convexSet : Set (domain × codomain)
  convexityProperty : Prop

structure AffineFunction (f : ConvexFunction) where
  linearPart : f.domain → f.codomain
  constantPart : f.codomain
  affineEquality : ∀ x : f.domain, f.functionVal x = linearPart x + constantPart

structure ConvexityCondition (f : ConvexFunction) where
  isConvex : ∀ (x y : f.domain) (t : ℝ), 0 ≤ t ∧ t ≤ 1 →
    f.functionVal (t • x + (1 - t) • y) ≤ t • f.functionVal x + (1 - t) • f.functionVal y

def ConvexFunctionClosed (f : ConvexFunction) : Prop :=
  f.convexityProperty

theorem convexity_closed_from_condition (f : ConvexFunction) (C : ConvexityCondition f) :
    ConvexFunctionClosed f :=
  C.isConvex

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse