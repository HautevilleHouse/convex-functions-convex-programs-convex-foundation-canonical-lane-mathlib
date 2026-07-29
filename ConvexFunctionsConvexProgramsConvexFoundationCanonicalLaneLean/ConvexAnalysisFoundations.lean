import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexAnalysisFoundation where
  convexSetTheory : Prop
  convexFunctionTheory : Prop
  subdifferentialCalculus : Prop
  fenchelConjugate : Prop
  supportFunctionTheory : Prop
  contractionAndMonotonicity : Prop
  lipschitzRegularity : Prop

def ConvexAnalysisFoundationsClosed (F : ConvexAnalysisFoundation) : Prop :=
  F.convexSetTheory ∧ F.convexFunctionTheory ∧ F.subdifferentialCalculus ∧
  F.fenchelConjugate ∧ F.supportFunctionTheory ∧ F.contractionAndMonotonicity ∧ F.lipschitzRegularity

structure ConvexAnalysisEvidence (F : ConvexAnalysisFoundation) where
  convexSetTheoryClosed : F.convexSetTheory
  convexFunctionTheoryClosed : F.convexFunctionTheory
  subdifferentialCalculusClosed : F.subdifferentialCalculus
  fenchelConjugateClosed : F.fenchelConjugate
  supportFunctionTheoryClosed : F.supportFunctionTheory
  contractionAndMonotonicityClosed : F.contractionAndMonotonicity
  lipschitzRegularityClosed : F.lipschitzRegularity

theorem convex_analysis_foundations_closed_from_evidence (F : ConvexAnalysisFoundation) (E : ConvexAnalysisEvidence F) :
    ConvexAnalysisFoundationsClosed F := by
  apply And.intro E.convexSetTheoryClosed
  apply And.intro E.convexFunctionTheoryClosed
  apply And.intro E.subdifferentialCalculusClosed
  apply And.intro E.fenchelConjugateClosed
  apply And.intro E.supportFunctionTheoryClosed
  exact And.intro E.contractionAndMonotonicityClosed E.lipschitzRegularityClosed

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse