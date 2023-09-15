// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ManagePublishStatusMutation: GraphQLMutation {
  public static let operationName: String = "managePublishStatus"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation managePublishStatus($listId: Int!, $action: String!) {
        managePublishStatus(listId: $listId, action: $action) {
          __typename
          status
          errorMessage
        }
      }
      """
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
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
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
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllList }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
