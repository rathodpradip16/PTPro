// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateWishListMutation: GraphQLMutation {
    static let operationName: String = "CreateWishList"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation CreateWishList($listId: Int!, $wishListGroupId: Int, $eventKey: Boolean) { CreateWishList( listId: $listId wishListGroupId: $wishListGroupId eventKey: $eventKey ) { __typename status errorMessage } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("CreateWishList", CreateWishList?.self, arguments: [
          "listId": .variable("listId"),
          "wishListGroupId": .variable("wishListGroupId"),
          "eventKey": .variable("eventKey")
        ]),
      ] }

      var createWishList: CreateWishList? { __data["CreateWishList"] }

      /// CreateWishList
      ///
      /// Parent Type: `WishList`
      struct CreateWishList: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishList }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}