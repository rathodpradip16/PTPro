// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetcategoryListcountQuery: GraphQLQuery {
    static let operationName: String = "getcategoryListcount"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getcategoryListcount($listId: Int) { getcategoryListcount(listId: $listId) { __typename status errorMessage results { __typename categoryList { __typename categoryName categoryCount photoCategoryId } photoList { __typename name id photoCategoryId } } } }"#
      ))

    public var listId: GraphQLNullable<Int>

    public init(listId: GraphQLNullable<Int>) {
      self.listId = listId
    }

    public var __variables: Variables? { ["listId": listId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getcategoryListcount", GetcategoryListcount?.self, arguments: ["listId": .variable("listId")]),
      ] }

      var getcategoryListcount: GetcategoryListcount? { __data["getcategoryListcount"] }

      /// GetcategoryListcount
      ///
      /// Parent Type: `CategoryListcountType`
      struct GetcategoryListcount: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CategoryListcountType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// GetcategoryListcount.Results
        ///
        /// Parent Type: `RresultssType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.RresultssType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("categoryList", [CategoryList?]?.self),
            .field("photoList", [PhotoList?]?.self),
          ] }

          var categoryList: [CategoryList?]? { __data["categoryList"] }
          var photoList: [PhotoList?]? { __data["photoList"] }

          /// GetcategoryListcount.Results.CategoryList
          ///
          /// Parent Type: `CategorysType`
          struct CategoryList: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.CategorysType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("categoryName", String?.self),
              .field("categoryCount", String?.self),
              .field("photoCategoryId", String?.self),
            ] }

            var categoryName: String? { __data["categoryName"] }
            var categoryCount: String? { __data["categoryCount"] }
            var photoCategoryId: String? { __data["photoCategoryId"] }
          }

          /// GetcategoryListcount.Results.PhotoList
          ///
          /// Parent Type: `PhotosType`
          struct PhotoList: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.PhotosType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
              .field("id", String?.self),
              .field("photoCategoryId", String?.self),
            ] }

            var name: String? { __data["name"] }
            var id: String? { __data["id"] }
            var photoCategoryId: String? { __data["photoCategoryId"] }
          }
        }
      }
    }
  }

}