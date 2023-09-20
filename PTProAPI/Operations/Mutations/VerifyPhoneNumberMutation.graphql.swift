// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class VerifyPhoneNumberMutation: GraphQLMutation {
  public static let operationName: String = "VerifyPhoneNumber"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation VerifyPhoneNumber($verificationCode: Int!) { VerifyPhoneNumber(verificationCode: $verificationCode) { __typename status errorMessage } }"#
    ))

  public var verificationCode: Int

  public init(verificationCode: Int) {
    self.verificationCode = verificationCode
  }

  public var __variables: Variables? { ["verificationCode": verificationCode] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("VerifyPhoneNumber", VerifyPhoneNumber?.self, arguments: ["verificationCode": .variable("verificationCode")]),
    ] }

    public var verifyPhoneNumber: VerifyPhoneNumber? { __data["VerifyPhoneNumber"] }

    /// VerifyPhoneNumber
    ///
    /// Parent Type: `UserAccount`
    public struct VerifyPhoneNumber: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
