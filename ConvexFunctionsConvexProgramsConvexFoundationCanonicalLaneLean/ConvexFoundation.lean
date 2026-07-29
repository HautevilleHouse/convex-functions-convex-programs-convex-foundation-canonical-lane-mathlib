import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.ConvexPrograms

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexFoundationPackage where
  program : ConvexProgramPackage
  kktConditions : Prop
  lagrangeMultipliersExist : Prop
  saddlePointProperty : Prop

structure ConvexFoundationEvidence (F : ConvexFoundationPackage) where
  kktConditionsClosed : F.kktConditions
  lagrangeMultipliersExistClosed : F.lagrangeMultipliersExist
  saddlePointPropertyClosed : F.saddlePointProperty

def ConvexFoundationClosed (F : ConvexFoundationPackage) : Prop :=
  F.kktConditions ∧ F.lagrangeMultipliersExist ∧ F.saddlePointProperty

theorem convex_foundation_closed_from_evidence (F : ConvexFoundationPackage)
    (E : ConvexFoundationEvidence F) : ConvexFoundationClosed F := by
  exact And.intro E.kktConditionsClosed
    (And.intro E.lagrangeMultipliersExistClosed E.saddlePointPropertyClosed)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse