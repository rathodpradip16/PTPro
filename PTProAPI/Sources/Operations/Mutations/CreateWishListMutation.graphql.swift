// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateWishListMutation: GraphQLMutation {
  public static let operationName: String = "CreateWishList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation CreateWishList($listId: Int!, $wishListGroupId: Int, $eventKey: Boolean) {
        CreateWishList(
          listId: $listId
          wishListGroupId: $wishListGroupId
          eventKey: $eventKey
        ) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var listId: Int
  public var wishListGroupId: GraphQLNullable<Int>
  public var eventKey: GraphQLNullable<Bool>

  public init(
    listId: Int,
    wishListGroupId: GraphQLNullable<Int>,
    eventKey: GraphQLNullable<Bool>
  ) {
    self.listId = listId
    self.wishListGroupId = wishListGroupId
    self.eventKey = eventKey
  }

  public var __variables: Variables? { [
    "listId": listId,
    "wishListGroupId": wishListGroupId,
    "eventKey": eventKey
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("CreateWishList", CreateWishList?.self, arguments: [
        "listId": .variable("listId"),
        "wishListGroupId": .variable("wishListGroupId"),
        "eventKey": .variable("eventKey")
      ]),
    ] }

    public var createWishList: CreateWishList? { __data["CreateWishList"] }

    /// CreateWishList
    ///
    /// Parent Type: `WishList`
    public struct CreateWishList: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.WishList }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
