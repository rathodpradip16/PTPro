// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UpdateWishListGroupMutation: GraphQLMutation {
    static let operationName: String = "UpdateWishListGroup"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("UpdateWishListGroup", UpdateWishListGroup?.self, arguments: [
          "isPublic": .variable("isPublic"),
          "id": .variable("id")
        ]),
      ] }

      var updateWishListGroup: UpdateWishListGroup? { __data["UpdateWishListGroup"] }

      /// UpdateWishListGroup
      ///
      /// Parent Type: `WishListGroup`
      struct UpdateWishListGroup: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishListGroup }
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