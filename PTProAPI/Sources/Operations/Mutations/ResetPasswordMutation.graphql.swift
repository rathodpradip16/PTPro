// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ResetPasswordMutation: GraphQLMutation {
  public static let operationName: String = "resetPassword"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation resetPassword($email: String!, $password: String!, $token: String!) { updateForgotPassword(email: $email, password: $password, token: $token) { __typename status errorMessage } }"#
    ))

  public var email: String
  public var password: String
  public var token: String

  public init(
    email: String,
    password: String,
    token: String
  ) {
    self.email = email
    self.password = password
    self.token = token
  }

  public var __variables: Variables? { [
    "email": email,
    "password": password,
    "token": token
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("updateForgotPassword", UpdateForgotPassword?.self, arguments: [
        "email": .variable("email"),
        "password": .variable("password"),
        "token": .variable("token")
      ]),
    ] }

    public var updateForgotPassword: UpdateForgotPassword? { __data["updateForgotPassword"] }

    /// UpdateForgotPassword
    ///
    /// Parent Type: `UserType`
    public struct UpdateForgotPassword: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
