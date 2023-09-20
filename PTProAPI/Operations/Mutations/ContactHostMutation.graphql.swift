// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ContactHostMutation: GraphQLMutation {
  public static let operationName: String = "ContactHost"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation ContactHost($listId: Int!, $hostId: String!, $content: String!, $userId: String!, $type: String, $startDate: String!, $endDate: String!, $personCapacity: Int) { CreateEnquiry( listId: $listId hostId: $hostId userId: $userId content: $content type: $type startDate: $startDate endDate: $endDate personCapacity: $personCapacity ) { __typename status errorMessage } }"#
    ))

  public var listId: Int
  public var hostId: String
  public var content: String
  public var userId: String
  public var type: GraphQLNullable<String>
  public var startDate: String
  public var endDate: String
  public var personCapacity: GraphQLNullable<Int>

  public init(
    listId: Int,
    hostId: String,
    content: String,
    userId: String,
    type: GraphQLNullable<String>,
    startDate: String,
    endDate: String,
    personCapacity: GraphQLNullable<Int>
  ) {
    self.listId = listId
    self.hostId = hostId
    self.content = content
    self.userId = userId
    self.type = type
    self.startDate = startDate
    self.endDate = endDate
    self.personCapacity = personCapacity
  }

  public var __variables: Variables? { [
    "listId": listId,
    "hostId": hostId,
    "content": content,
    "userId": userId,
    "type": type,
    "startDate": startDate,
    "endDate": endDate,
    "personCapacity": personCapacity
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("CreateEnquiry", CreateEnquiry?.self, arguments: [
        "listId": .variable("listId"),
        "hostId": .variable("hostId"),
        "userId": .variable("userId"),
        "content": .variable("content"),
        "type": .variable("type"),
        "startDate": .variable("startDate"),
        "endDate": .variable("endDate"),
        "personCapacity": .variable("personCapacity")
      ]),
    ] }

    public var createEnquiry: CreateEnquiry? { __data["CreateEnquiry"] }

    /// CreateEnquiry
    ///
    /// Parent Type: `Enquiry`
    public struct CreateEnquiry: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Enquiry }
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
