// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class PreapproveMutation: GraphQLMutation {
    static let operationName: String = "preapprove"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation preapprove($threadId: Int!, $content: String, $type: String, $startDate: String, $endDate: String, $personCapacity: Int, $reservationId: Int) { sendMessage( threadId: $threadId content: $content type: $type startDate: $startDate endDate: $endDate personCapacity: $personCapacity reservationId: $reservationId ) { __typename results { __typename id sentBy content type reservationId startDate endDate createdAt personCapacity } status errorMessage } }"#
      ))

    public var threadId: Int
    public var content: GraphQLNullable<String>
    public var type: GraphQLNullable<String>
    public var startDate: GraphQLNullable<String>
    public var endDate: GraphQLNullable<String>
    public var personCapacity: GraphQLNullable<Int>
    public var reservationId: GraphQLNullable<Int>

    public init(
      threadId: Int,
      content: GraphQLNullable<String>,
      type: GraphQLNullable<String>,
      startDate: GraphQLNullable<String>,
      endDate: GraphQLNullable<String>,
      personCapacity: GraphQLNullable<Int>,
      reservationId: GraphQLNullable<Int>
    ) {
      self.threadId = threadId
      self.content = content
      self.type = type
      self.startDate = startDate
      self.endDate = endDate
      self.personCapacity = personCapacity
      self.reservationId = reservationId
    }

    public var __variables: Variables? { [
      "threadId": threadId,
      "content": content,
      "type": type,
      "startDate": startDate,
      "endDate": endDate,
      "personCapacity": personCapacity,
      "reservationId": reservationId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("sendMessage", SendMessage?.self, arguments: [
          "threadId": .variable("threadId"),
          "content": .variable("content"),
          "type": .variable("type"),
          "startDate": .variable("startDate"),
          "endDate": .variable("endDate"),
          "personCapacity": .variable("personCapacity"),
          "reservationId": .variable("reservationId")
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
            .field("personCapacity", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var sentBy: String? { __data["sentBy"] }
          var content: String? { __data["content"] }
          var type: String? { __data["type"] }
          var reservationId: Int? { __data["reservationId"] }
          var startDate: String? { __data["startDate"] }
          var endDate: String? { __data["endDate"] }
          var createdAt: String? { __data["createdAt"] }
          var personCapacity: Int? { __data["personCapacity"] }
        }
      }
    }
  }

}