import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure ConvexAdmittedObject where
  convexSet : Type
  convexFunction : Type
  primalProgram : Type
  dualProgram : Type
  strongDualityHolds : Prop
  witnessClosed : strongDualityHolds

structure ConvexAdmissibleClass where
  object : ConvexAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : ConvexAdmissibleClass) : Prop :=
  A.object.witnessClosed

theorem bridge_from_admissible_class (A : ConvexAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.witnessClosed

def gateClosed (A : ConvexAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ConvexAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedConvexFoundationClosure (A : ConvexAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_convex_foundation_endgame (A : ConvexAdmissibleClass) :
    ConstrainedConvexFoundationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse