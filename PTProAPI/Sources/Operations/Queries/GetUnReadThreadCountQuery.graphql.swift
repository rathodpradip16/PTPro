// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetUnReadThreadCountQuery: GraphQLQuery {
  public static let operationName: String = "getUnReadThreadCount"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getUnReadThreadCount($threadId: Int) {
        getUnReadThreadCount(threadId: $threadId) {
          __typename
          results {
            __typename
            isUnReadMessage
            messageCount
          }
          status
          errorMessage
        }
      }
      """
    ))

  public var threadId: GraphQLNullable<Int>

  public init(threadId: GraphQLNullable<Int>) {
    self.threadId = threadId
  }

  public var __variables: Variables? { ["threadId": threadId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getUnReadThreadCount", GetUnReadThreadCount?.self, arguments: ["threadId": .variable("threadId")]),
    ] }

    public var getUnReadThreadCount: GetUnReadThreadCount? { __data["getUnReadThreadCount"] }

    /// GetUnReadThreadCount
    ///
    /// Parent Type: `UnreadThreadsCount`
    public struct GetUnReadThreadCount: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.UnreadThreadsCount }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetUnReadThreadCount.Results
      ///
      /// Parent Type: `UnReadCount`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.UnReadCount }
        public static var __selections: [Selection] { [
          .field("isUnReadMessage", Bool?.self),
          .field("messageCount", Int?.self),
        ] }

        public var isUnReadMessage: Bool? { __data["isUnReadMessage"] }
        public var messageCount: Int? { __data["messageCount"] }
      }
    }
  }
}
