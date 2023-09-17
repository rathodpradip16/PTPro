// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ManagePublishStatusMutation: GraphQLMutation {
  public static let operationName: String = "managePublishStatus"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation managePublishStatus($listId: Int!, $action: String!) { managePublishStatus(listId: $listId, action: $action) { __typename status errorMessage } }"#
    ))

  public var listId: Int
  public var action: String

  public init(
    listId: Int,
    action: String
  ) {
    self.listId = listId
    self.action = action
  }

  public var __variables: Variables? { [
    "listId": listId,
    "action": action
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("managePublishStatus", ManagePublishStatus?.self, arguments: [
        "listId": .variable("listId"),
        "action": .variable("action")
      ]),
    ] }

    public var managePublishStatus: ManagePublishStatus? { __data["managePublishStatus"] }

    /// ManagePublishStatus
    ///
    /// Parent Type: `AllList`
    public struct ManagePublishStatus: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
