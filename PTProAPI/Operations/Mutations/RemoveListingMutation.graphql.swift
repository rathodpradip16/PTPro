// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class RemoveListingMutation: GraphQLMutation {
    static let operationName: String = "RemoveListing"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation RemoveListing($listId: Int!) { RemoveListing(listId: $listId) { __typename results { __typename id name } status errorMessage } }"#
      ))

    public var listId: Int

    public init(listId: Int) {
      self.listId = listId
    }

    public var __variables: Variables? { ["listId": listId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("RemoveListing", RemoveListing?.self, arguments: ["listId": .variable("listId")]),
      ] }

      var removeListing: RemoveListing? { __data["RemoveListing"] }

      /// RemoveListing
      ///
      /// Parent Type: `ListPhotosCommon`
      struct RemoveListing: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// RemoveListing.Result
        ///
        /// Parent Type: `ListPhotos`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotos }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String?.self),
          ] }

          var id: Int { __data["id"] }
          var name: String? { __data["name"] }
        }
      }
    }
  }

}