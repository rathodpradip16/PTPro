// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class UpdateWishListGroupMutation: GraphQLMutation {
  public static let operationName: String = "UpdateWishListGroup"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateWishListGroup($isPublic: Int, $id: Int!) { UpdateWishListGroup(isPublic: $isPublic, id: $id) { __typename status errorMessage } }"#
    ))

  public var isPublic: GraphQLNullable<Int>
  public var id: Int

  public init(
    isPublic: GraphQLNullable<Int>,
    id: Int
  ) {
    self.isPublic = isPublic
    self.id = id
  }

  public var __variables: Variables? { [
    "isPublic": isPublic,
    "id": id
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("UpdateWishListGroup", UpdateWishListGroup?.self, arguments: [
        "isPublic": .variable("isPublic"),
        "id": .variable("id")
      ]),
    ] }

    public var updateWishListGroup: UpdateWishListGroup? { __data["UpdateWishListGroup"] }

    /// UpdateWishListGroup
    ///
    /// Parent Type: `WishListGroup`
    public struct UpdateWishListGroup: PTProAPI.SelectionSet {
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
