// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetImageBannerQuery: GraphQLQuery {
    static let operationName: String = "getImageBanner"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getImageBanner { getImageBanner { __typename result { __typename id title description buttonLabel image } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getImageBanner", GetImageBanner?.self),
      ] }

      var getImageBanner: GetImageBanner? { __data["getImageBanner"] }

      /// GetImageBanner
      ///
      /// Parent Type: `ImageBannerCommonType`
      struct GetImageBanner: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ImageBannerCommonType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", Result?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: Result? { __data["result"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetImageBanner.Result
        ///
        /// Parent Type: `ImageBanner`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ImageBanner }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("description", String?.self),
            .field("buttonLabel", String?.self),
            .field("image", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var description: String? { __data["description"] }
          var buttonLabel: String? { __data["buttonLabel"] }
          var image: String? { __data["image"] }
        }
      }
    }
  }

}