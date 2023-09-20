// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class DeleteWishListGroupMutation: GraphQLMutation {
    static let operationName: String = "DeleteWishListGroup"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation DeleteWishListGroup($id: Int!) { DeleteWishListGroup(id: $id) { __typename status errorMessage } }"#
      ))

    public var id: Int

    public init(id: Int) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("DeleteWishListGroup", DeleteWishListGroup?.self, arguments: ["id": .variable("id")]),
      ] }

      var deleteWishListGroup: DeleteWishListGroup? { __data["DeleteWishListGroup"] }

      /// DeleteWishListGroup
      ///
      /// Parent Type: `WishListGroup`
      struct DeleteWishListGroup: PTProAPI.SelectionSet {
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