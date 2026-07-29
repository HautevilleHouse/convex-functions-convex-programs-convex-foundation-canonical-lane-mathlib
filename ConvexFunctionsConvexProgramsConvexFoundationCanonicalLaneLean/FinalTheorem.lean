import canonicalLaneMathlib.AdmissibleClass
import ConvexSet
import ConvexFunction
import ConvexProgram
import Duality
import Optimality

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

def ConstrainedConvexFoundationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_convex_foundation_endgame (A : AdmissibleClass) : ConstrainedConvexFoundationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse
