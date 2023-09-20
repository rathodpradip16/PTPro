// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class DeleteWishListGroupMutation: GraphQLMutation {
  public static let operationName: String = "DeleteWishListGroup"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteWishListGroup($id: Int!) { DeleteWishListGroup(id: $id) { __typename status errorMessage } }"#
    ))

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("DeleteWishListGroup", DeleteWishListGroup?.self, arguments: ["id": .variable("id")]),
    ] }

    public var deleteWishListGroup: DeleteWishListGroup? { __data["DeleteWishListGroup"] }

    /// DeleteWishListGroup
    ///
    /// Parent Type: `WishListGroup`
    public struct DeleteWishListGroup: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishListGroup }
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
