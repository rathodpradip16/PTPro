// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class EmailVerificationMutation: GraphQLMutation {
  public static let operationName: String = "EmailVerification"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation EmailVerification($token: String!, $email: String!) { EmailVerification(token: $token, email: $email) { __typename status errorMessage } }"#
    ))

  public var token: String
  public var email: String

  public init(
    token: String,
    email: String
  ) {
    self.token = token
    self.email = email
  }

  public var __variables: Variables? { [
    "token": token,
    "email": email
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("EmailVerification", EmailVerification?.self, arguments: [
        "token": .variable("token"),
        "email": .variable("email")
      ]),
    ] }

    public var emailVerification: EmailVerification? { __data["EmailVerification"] }

    /// EmailVerification
    ///
    /// Parent Type: `AllEmailToken`
    public struct EmailVerification: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllEmailToken }
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
