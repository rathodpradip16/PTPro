// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetUnReadThreadCountQuery: GraphQLQuery {
    static let operationName: String = "getUnReadThreadCount"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getUnReadThreadCount($threadId: Int) { getUnReadThreadCount(threadId: $threadId) { __typename results { __typename isUnReadMessage messageCount } status errorMessage } }"#
      ))

    public var threadId: GraphQLNullable<Int>

    public init(threadId: GraphQLNullable<Int>) {
      self.threadId = threadId
    }

    public var __variables: Variables? { ["threadId": threadId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getUnReadThreadCount", GetUnReadThreadCount?.self, arguments: ["threadId": .variable("threadId")]),
      ] }

      var getUnReadThreadCount: GetUnReadThreadCount? { __data["getUnReadThreadCount"] }

      /// GetUnReadThreadCount
      ///
      /// Parent Type: `UnreadThreadsCount`
      struct GetUnReadThreadCount: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UnreadThreadsCount }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetUnReadThreadCount.Results
        ///
        /// Parent Type: `UnReadCount`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.UnReadCount }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("isUnReadMessage", Bool?.self),
            .field("messageCount", Int?.self),
          ] }

          var isUnReadMessage: Bool? { __data["isUnReadMessage"] }
          var messageCount: Int? { __data["messageCount"] }
        }
      }
    }
  }

}