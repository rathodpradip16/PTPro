// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ReservationStatusMutation: GraphQLMutation {
  public static let operationName: String = "ReservationStatus"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation ReservationStatus($threadId: Int!, $content: String, $type: String, $startDate: String, $endDate: String, $personCapacity: Int, $reservationId: Int, $actionType: String) { ReservationStatus( threadId: $threadId content: $content type: $type startDate: $startDate endDate: $endDate personCapacity: $personCapacity reservationId: $reservationId actionType: $actionType ) { __typename status errorMessage } }"#
    ))

  public var threadId: Int
  public var content: GraphQLNullable<String>
  public var type: GraphQLNullable<String>
  public var startDate: GraphQLNullable<String>
  public var endDate: GraphQLNullable<String>
  public var personCapacity: GraphQLNullable<Int>
  public var reservationId: GraphQLNullable<Int>
  public var actionType: GraphQLNullable<String>

  public init(
    threadId: Int,
    content: GraphQLNullable<String>,
    type: GraphQLNullable<String>,
    startDate: GraphQLNullable<String>,
    endDate: GraphQLNullable<String>,
    personCapacity: GraphQLNullable<Int>,
    reservationId: GraphQLNullable<Int>,
    actionType: GraphQLNullable<String>
  ) {
    self.threadId = threadId
    self.content = content
    self.type = type
    self.startDate = startDate
    self.endDate = endDate
    self.personCapacity = personCapacity
    self.reservationId = reservationId
    self.actionType = actionType
  }

  public var __variables: Variables? { [
    "threadId": threadId,
    "content": content,
    "type": type,
    "startDate": startDate,
    "endDate": endDate,
    "personCapacity": personCapacity,
    "reservationId": reservationId,
    "actionType": actionType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("ReservationStatus", ReservationStatus?.self, arguments: [
        "threadId": .variable("threadId"),
        "content": .variable("content"),
        "type": .variable("type"),
        "startDate": .variable("startDate"),
        "endDate": .variable("endDate"),
        "personCapacity": .variable("personCapacity"),
        "reservationId": .variable("reservationId"),
        "actionType": .variable("actionType")
      ]),
    ] }

    public var reservationStatus: ReservationStatus? { __data["ReservationStatus"] }

    /// ReservationStatus
    ///
    /// Parent Type: `SendMessage`
    public struct ReservationStatus: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.SendMessage }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
