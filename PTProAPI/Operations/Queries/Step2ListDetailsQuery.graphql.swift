// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class Step2ListDetailsQuery: GraphQLQuery {
    static let operationName: String = "Step2ListDetails"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query Step2ListDetails($listId: String!, $listIdInt: Int!, $preview: Boolean) { getListingDetails(listId: $listId, preview: $preview) { __typename results { __typename id userId title description coverPhoto } status errorMessage } showListPhotos(listId: $listIdInt) { __typename results { __typename id listId name type isCover photosCount photoCategory { __typename id photoCategoryId name svgurl } } status errorMessage } }"#
      ))

    public var listId: String
    public var listIdInt: Int
    public var preview: GraphQLNullable<Bool>

    public init(
      listId: String,
      listIdInt: Int,
      preview: GraphQLNullable<Bool>
    ) {
      self.listId = listId
      self.listIdInt = listIdInt
      self.preview = preview
    }

    public var __variables: Variables? { [
      "listId": listId,
      "listIdInt": listIdInt,
      "preview": preview
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getListingDetails", GetListingDetails?.self, arguments: [
          "listId": .variable("listId"),
          "preview": .variable("preview")
        ]),
        .field("showListPhotos", ShowListPhotos?.self, arguments: ["listId": .variable("listIdInt")]),
      ] }

      var getListingDetails: GetListingDetails? { __data["getListingDetails"] }
      var showListPhotos: ShowListPhotos? { __data["showListPhotos"] }

      /// GetListingDetails
      ///
      /// Parent Type: `AllListing`
      struct GetListingDetails: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListing }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetListingDetails.Results
        ///
        /// Parent Type: `ShowListing`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("userId", String?.self),
            .field("title", String?.self),
            .field("description", String?.self),
            .field("coverPhoto", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var title: String? { __data["title"] }
          var description: String? { __data["description"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
        }
      }

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
            .field("photoCategory", PhotoCategory?.self),
          ] }

          var id: Int { __data["id"] }
          var listId: Int { __data["listId"] }
          var name: String? { __data["name"] }
          var type: String? { __data["type"] }
          var isCover: Int? { __data["isCover"] }
          var photosCount: Int? { __data["photosCount"] }
          var photoCategory: PhotoCategory? { __data["photoCategory"] }

          /// ShowListPhotos.Result.PhotoCategory
          ///
          /// Parent Type: `PhotoCategorylistdataType`
          struct PhotoCategory: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.PhotoCategorylistdataType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("photoCategoryId", Int?.self),
              .field("name", String?.self),
              .field("svgurl", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var photoCategoryId: Int? { __data["photoCategoryId"] }
            var name: String? { __data["name"] }
            var svgurl: String? { __data["svgurl"] }
          }
        }
      }
    }
  }

}