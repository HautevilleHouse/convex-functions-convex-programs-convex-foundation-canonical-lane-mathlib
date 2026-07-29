import canonicalLaneMathlib.AdmissibleClass
import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.ConvexFunction

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure FenchelDualityPackage (F : ConvexFunctionPackage) where
  conjugateFunction : ConvexFunctionPackage
  biconjugateEqualsOriginal : Prop
  fenchelYoungInequality : Prop
  fenchelDualityTheorem : Prop

def FenchelDualityClosed {F : ConvexFunctionPackage} (D : FenchelDualityPackage F) : Prop :=
  D.biconjugateEqualsOriginal ∧ D.fenchelYoungInequality ∧ D.fenchelDualityTheorem

structure FenchelDualityEvidence {F : ConvexFunctionPackage} (D : FenchelDualityPackage F) where
  biconjugateEqualsOriginalClosed : D.biconjugateEqualsOriginal
  fenchelYoungInequalityClosed : D.fenchelYoungInequality
  fenchelDualityTheoremClosed : D.fenchelDualityTheorem

theorem fenchel_duality_closed_from_evidence {F : ConvexFunctionPackage} (D : FenchelDualityPackage F) (E : FenchelDualityEvidence D) :
  FenchelDualityClosed D := by
  exact And.intro E.biconjugateEqualsOriginalClosed (And.intro E.fenchelYoungInequalityClosed E.fenchelDualityTheoremClosed)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse