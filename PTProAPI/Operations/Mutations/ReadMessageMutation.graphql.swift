// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ReadMessageMutation: GraphQLMutation {
    static let operationName: String = "readMessage"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation readMessage($threadId: Int!) { readMessage(threadId: $threadId) { __typename status message errorMessage } }"#
      ))

    public var threadId: Int

    public init(threadId: Int) {
      self.threadId = threadId
    }

    public var __variables: Variables? { ["threadId": threadId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("readMessage", ReadMessage?.self, arguments: ["threadId": .variable("threadId")]),
      ] }

      var readMessage: ReadMessage? { __data["readMessage"] }

      /// ReadMessage
      ///
      /// Parent Type: `SendMessage`
      struct ReadMessage: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SendMessage }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("message", String?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var message: String? { __data["message"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}