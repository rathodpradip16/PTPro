// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class VerifyPhoneNumberMutation: GraphQLMutation {
  public static let operationName: String = "VerifyPhoneNumber"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation VerifyPhoneNumber($verificationCode: Int!) {
        VerifyPhoneNumber(verificationCode: $verificationCode) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var verificationCode: Int

  public init(verificationCode: Int) {
    self.verificationCode = verificationCode
  }

  public var __variables: Variables? { ["verificationCode": verificationCode] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("VerifyPhoneNumber", VerifyPhoneNumber?.self, arguments: ["verificationCode": .variable("verificationCode")]),
    ] }

    public var verifyPhoneNumber: VerifyPhoneNumber? { __data["VerifyPhoneNumber"] }

    /// VerifyPhoneNumber
    ///
    /// Parent Type: `UserAccount`
    public struct VerifyPhoneNumber: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.UserAccount }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
