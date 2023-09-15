// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ReadMessageMutation: GraphQLMutation {
  public static let operationName: String = "readMessage"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation readMessage($threadId: Int!) {
        readMessage(threadId: $threadId) {
          __typename
          status
          message
          errorMessage
        }
      }
      """
    ))

  public var threadId: Int

  public init(threadId: Int) {
    self.threadId = threadId
  }

  public var __variables: Variables? { ["threadId": threadId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("readMessage", ReadMessage?.self, arguments: ["threadId": .variable("threadId")]),
    ] }

    public var readMessage: ReadMessage? { __data["readMessage"] }

    /// ReadMessage
    ///
    /// Parent Type: `SendMessage`
    public struct ReadMessage: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.SendMessage }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("message", String?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var message: String? { __data["message"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
