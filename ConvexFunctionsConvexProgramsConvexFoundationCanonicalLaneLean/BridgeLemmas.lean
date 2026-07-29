import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | ConvexFunctionObj f => ConvexFunctionClosed f
  | ConvexProgramObj P => ConvexProgramClosed P
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    cases A.object with
    | ConvexFunctionObj f =>
      -- Assumes A.object.conclusion provides ConvexFunctionClosed f
      exact A.object.conclusion
    | ConvexProgramObj P =>
      -- Assumes A.object.conclusion provides ConvexProgramClosed P
      exact A.object.conclusion
    | _ =>
      -- Other cases are not supported
      exact A.object.conclusion

end ConvexFunctionsConvexProgramsConvexFoundationCanonicalLaneLean
end HautevilleHouse