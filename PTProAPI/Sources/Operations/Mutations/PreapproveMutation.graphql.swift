// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PreapproveMutation: GraphQLMutation {
  public static let operationName: String = "preapprove"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
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

    public var sendMessage: SendMessage? { __data["sendMessage"] }

    /// SendMessage
    ///
    /// Parent Type: `SendMessage`
    public struct SendMessage: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SendMessage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// SendMessage.Results
      ///
      /// Parent Type: `ThreadItems`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ThreadItems }
        public static var __selections: [ApolloAPI.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var sentBy: String? { __data["sentBy"] }
        public var content: String? { __data["content"] }
        public var type: String? { __data["type"] }
        public var reservationId: Int? { __data["reservationId"] }
        public var startDate: String? { __data["startDate"] }
        public var endDate: String? { __data["endDate"] }
        public var createdAt: String? { __data["createdAt"] }
        public var personCapacity: Int? { __data["personCapacity"] }
      }
    }
  }
}
