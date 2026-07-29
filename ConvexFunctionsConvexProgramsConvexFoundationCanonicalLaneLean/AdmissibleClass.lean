import ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : ConvexAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ConvexWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse