import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexFunctionPackage where
  domain : Type u
  codomain : Type v
  function : domain → codomain
  convexityCondition : Prop
  lowerSemicontinuous : Prop
  proper : Prop

def ConvexFunctionClosed (C : ConvexFunctionPackage) : Prop :=
  C.convexityCondition ∧ C.lowerSemicontinuous ∧ C.proper

structure ConvexFunctionEvidence (C : ConvexFunctionPackage) where
  convexityConditionClosed : C.convexityCondition
  lowerSemicontinuousClosed : C.lowerSemicontinuous
  properClosed : C.proper

theorem convex_function_closed_from_evidence (C : ConvexFunctionPackage) (E : ConvexFunctionEvidence C) :
  ConvexFunctionClosed C := by
  exact And.intro E.convexityConditionClosed (And.intro E.lowerSemicontinuousClosed E.properClosed)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse