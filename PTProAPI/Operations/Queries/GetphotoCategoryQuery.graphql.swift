// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetphotoCategoryQuery: GraphQLQuery {
    static let operationName: String = "getphotoCategory"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getphotoCategory { getphotoCategory { __typename status errorMessage results { __typename photoCategorysTypes { __typename id photoCategoryId name svgurl } } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getphotoCategory", GetphotoCategory?.self),
      ] }

      var getphotoCategory: GetphotoCategory? { __data["getphotoCategory"] }

      /// GetphotoCategory
      ///
      /// Parent Type: `PhotoCategoryType`
      struct GetphotoCategory: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.PhotoCategoryType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// GetphotoCategory.Results
        ///
        /// Parent Type: `Results1Type`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Results1Type }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("photoCategorysTypes", [PhotoCategorysType?]?.self),
          ] }

          var photoCategorysTypes: [PhotoCategorysType?]? { __data["photoCategorysTypes"] }

          /// GetphotoCategory.Results.PhotoCategorysType
          ///
          /// Parent Type: `PhotoCategorylistType`
          struct PhotoCategorysType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.PhotoCategorylistType }
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