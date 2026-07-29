import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexFunctionPackage where
  domain : Type u
  ambientSpace : Type v
  function : domain → ℝ
  domainConvex : Prop
  functionConvex : Prop
  properness : Prop
  lowerSemicontinuous : Prop

def ConvexFunctionClosed (F : ConvexFunctionPackage) : Prop :=
  F.domainConvex ∧ F.functionConvex ∧ F.properness ∧ F.lowerSemicontinuous

structure ConvexFunctionEvidence (F : ConvexFunctionPackage) where
  domainConvexClosed : F.domainConvex
  functionConvexClosed : F.functionConvex
  propernessClosed : F.properness
  lowerSemicontinuousClosed : F.lowerSemicontinuous

theorem convex_function_closed_from_evidence (F : ConvexFunctionPackage) (E : ConvexFunctionEvidence F) :
    ConvexFunctionClosed F := by
  exact And.intro E.domainConvexClosed
    (And.intro E.functionConvexClosed (And.intro E.propernessClosed E.lowerSemicontinuousClosed))

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse