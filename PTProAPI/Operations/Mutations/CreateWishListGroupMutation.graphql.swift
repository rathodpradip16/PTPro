// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateWishListGroupMutation: GraphQLMutation {
    static let operationName: String = "CreateWishListGroup"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation CreateWishListGroup($name: String!, $isPublic: String, $id: Int) { CreateWishListGroup(name: $name, isPublic: $isPublic, id: $id) { __typename status errorMessage results { __typename name isPublic id } } }"#
      ))

    public var name: String
    public var isPublic: GraphQLNullable<String>
    public var id: GraphQLNullable<Int>

    public init(
      name: String,
      isPublic: GraphQLNullable<String>,
      id: GraphQLNullable<Int>
    ) {
      self.name = name
      self.isPublic = isPublic
      self.id = id
    }

    public var __variables: Variables? { [
      "name": name,
      "isPublic": isPublic,
      "id": id
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("CreateWishListGroup", CreateWishListGroup?.self, arguments: [
          "name": .variable("name"),
          "isPublic": .variable("isPublic"),
          "id": .variable("id")
        ]),
      ] }

      var createWishListGroup: CreateWishListGroup? { __data["CreateWishListGroup"] }

      /// CreateWishListGroup
      ///
      /// Parent Type: `GetWishListType`
      struct CreateWishListGroup: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetWishListType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// CreateWishListGroup.Results
        ///
        /// Parent Type: `WishListGroup`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishListGroup }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("isPublic", String?.self),
            .field("id", Int?.self),
          ] }

          var name: String? { __data["name"] }
          var isPublic: String? { __data["isPublic"] }
          var id: Int? { __data["id"] }
        }
      }
    }
  }

}