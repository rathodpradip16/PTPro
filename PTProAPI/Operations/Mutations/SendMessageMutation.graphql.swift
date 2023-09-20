// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SendMessageMutation: GraphQLMutation {
    static let operationName: String = "sendMessage"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation sendMessage($threadId: Int!, $content: String, $type: String) { sendMessage(threadId: $threadId, content: $content, type: $type) { __typename results { __typename id sentBy content type reservationId startDate endDate createdAt } status errorMessage } }"#
      ))

    public var threadId: Int
    public var content: GraphQLNullable<String>
    public var type: GraphQLNullable<String>

    public init(
      threadId: Int,
      content: GraphQLNullable<String>,
      type: GraphQLNullable<String>
    ) {
      self.threadId = threadId
      self.content = content
      self.type = type
    }

    public var __variables: Variables? { [
      "threadId": threadId,
      "content": content,
      "type": type
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("sendMessage", SendMessage?.self, arguments: [
          "threadId": .variable("threadId"),
          "content": .variable("content"),
          "type": .variable("type")
        ]),
      ] }

      var sendMessage: SendMessage? { __data["sendMessage"] }

      /// SendMessage
      ///
      /// Parent Type: `SendMessage`
      struct SendMessage: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SendMessage }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// SendMessage.Results
        ///
        /// Parent Type: `ThreadItems`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ThreadItems }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("sentBy", String?.self),
            .field("content", String?.self),
            .field("type", String?.self),
            .field("reservationId", Int?.self),
            .field("startDate", String?.self),
            .field("endDate", String?.self),
            .field("createdAt", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var sentBy: String? { __data["sentBy"] }
          var content: String? { __data["content"] }
          var type: String? { __data["type"] }
          var reservationId: Int? { __data["reservationId"] }
          var startDate: String? { __data["startDate"] }
          var endDate: String? { __data["endDate"] }
          var createdAt: String? { __data["createdAt"] }
        }
      }
    }
  }

}