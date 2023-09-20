// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ShowListPhotosQuery: GraphQLQuery {
    static let operationName: String = "ShowListPhotos"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query ShowListPhotos($listId: Int!) { showListPhotos(listId: $listId) { __typename results { __typename id listId name type isCover photosCount } status errorMessage } }"#
      ))

    public var listId: Int

    public init(listId: Int) {
      self.listId = listId
    }

    public var __variables: Variables? { ["listId": listId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("showListPhotos", ShowListPhotos?.self, arguments: ["listId": .variable("listId")]),
      ] }

      var showListPhotos: ShowListPhotos? { __data["showListPhotos"] }

      /// ShowListPhotos
      ///
      /// Parent Type: `ListPhotosCommon`
      struct ShowListPhotos: PTProAPI.SelectionSet {
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

        /// ShowListPhotos.Result
        ///
        /// Parent Type: `ListPhotos`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotos }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("listId", Int.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("isCover", Int?.self),
            .field("photosCount", Int?.self),
          ] }

          var id: Int { __data["id"] }
          var listId: Int { __data["listId"] }
          var name: String? { __data["name"] }
          var type: String? { __data["type"] }
          var isCover: Int? { __data["isCover"] }
          var photosCount: Int? { __data["photosCount"] }
        }
      }
    }
  }

}