// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ForgotPasswordMutation: GraphQLMutation {
  public static let operationName: String = "ForgotPassword"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation ForgotPassword($email: String!) { userForgotPassword(email: $email) { __typename status forgotLink errorMessage } }"#
    ))

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var __variables: Variables? { ["email": email] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("userForgotPassword", UserForgotPassword?.self, arguments: ["email": .variable("email")]),
    ] }

    public var userForgotPassword: UserForgotPassword? { __data["userForgotPassword"] }

    /// UserForgotPassword
    ///
    /// Parent Type: `UserType`
    public struct UserForgotPassword: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("forgotLink", String?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var forgotLink: String? { __data["forgotLink"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
