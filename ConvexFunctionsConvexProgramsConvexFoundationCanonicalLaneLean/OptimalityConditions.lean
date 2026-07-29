import canonicalLaneMathlib.AdmissibleClass
import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.ConvexFunction

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure OptimalityConditionsPackage where
  subgradientCondition : Prop
  kktConditions : Prop
  stationaryPoint : Prop
  lagrangeMultipliersExist : Prop

def OptimalityConditionsClosed (O : OptimalityConditionsPackage) : Prop :=
  O.subgradientCondition ∧ O.kktConditions ∧ O.stationaryPoint ∧ O.lagrangeMultipliersExist

structure OptimalityConditionsEvidence (O : OptimalityConditionsPackage) where
  subgradientConditionClosed : O.subgradientCondition
  kktConditionsClosed : O.kktConditions
  stationaryPointClosed : O.stationaryPoint
  lagrangeMultipliersExistClosed : O.lagrangeMultipliersExist

theorem optimality_conditions_closed_from_evidence (O : OptimalityConditionsPackage) (E : OptimalityConditionsEvidence O) :
  OptimalityConditionsClosed O := by
  exact And.intro E.subgradientConditionClosed (And.intro E.kktConditionsClosed (And.intro E.stationaryPointClosed E.lagrangeMultipliersExistClosed))

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse