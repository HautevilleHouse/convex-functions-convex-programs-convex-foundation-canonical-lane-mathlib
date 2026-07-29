import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure DualityPackage {F : ConvexFunctionPackage} (P : ConvexProgramPackage F) where
  lagrangianDefined : Prop
  dualFunctionConvex : Prop
  weakDuality : Prop
  strongDuality : Prop
  slaterCondition : Prop
  kktConditions : Prop

def DualityClosed {F : ConvexFunctionPackage} {P : ConvexProgramPackage F} (D : DualityPackage P) : Prop :=
  D.lagrangianDefined ∧ D.dualFunctionConvex ∧ D.weakDuality ∧ D.strongDuality ∧ D.slaterCondition ∧ D.kktConditions

structure DualityEvidence {F : ConvexFunctionPackage} {P : ConvexProgramPackage F} (D : DualityPackage P) where
  lagrangianDefinedClosed : D.lagrangianDefined
  dualFunctionConvexClosed : D.dualFunctionConvex
  weakDualityClosed : D.weakDuality
  strongDualityClosed : D.strongDuality
  slaterConditionClosed : D.slaterCondition
  kktConditionsClosed : D.kktConditions

theorem duality_closed_from_evidence {F : ConvexFunctionPackage} {P : ConvexProgramPackage F} (D : DualityPackage P) (E : DualityEvidence D) :
    DualityClosed D := by
  apply And.intro E.lagrangianDefinedClosed
  apply And.intro E.dualFunctionConvexClosed
  apply And.intro E.weakDualityClosed
  apply And.intro E.strongDualityClosed
  exact And.intro E.slaterConditionClosed E.kktConditionsClosed

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse