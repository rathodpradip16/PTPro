// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CheckEmailExistsQuery: GraphQLQuery {
  public static let operationName: String = "CheckEmailExists"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query CheckEmailExists($email: String!) {
        validateEmailExist(email: $email) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var __variables: Variables? { ["email": email] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("validateEmailExist", ValidateEmailExist?.self, arguments: ["email": .variable("email")]),
    ] }

    public var validateEmailExist: ValidateEmailExist? { __data["validateEmailExist"] }

    /// ValidateEmailExist
    ///
    /// Parent Type: `CommonType`
    public struct ValidateEmailExist: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.CommonType }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
