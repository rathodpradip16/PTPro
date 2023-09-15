// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SendUserFeedbackMutation: GraphQLMutation {
  public static let operationName: String = "sendUserFeedback"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation sendUserFeedback($type: String, $message: String) {
        userFeedback(type: $type, message: $message) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var type: GraphQLNullable<String>
  public var message: GraphQLNullable<String>

  public init(
    type: GraphQLNullable<String>,
    message: GraphQLNullable<String>
  ) {
    self.type = type
    self.message = message
  }

  public var __variables: Variables? { [
    "type": type,
    "message": message
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("userFeedback", UserFeedback?.self, arguments: [
        "type": .variable("type"),
        "message": .variable("message")
      ]),
    ] }

    public var userFeedback: UserFeedback? { __data["userFeedback"] }

    /// UserFeedback
    ///
    /// Parent Type: `ReportUserResult`
    public struct UserFeedback: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ReportUserResult }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
