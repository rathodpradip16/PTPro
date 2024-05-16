// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetStaticPageContentQuery: GraphQLQuery {
    static let operationName: String = "getStaticPageContent"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getStaticPageContent($pageName: String) { getStaticPageContent(pageName: $pageName) { __typename status errorMessage result { __typename id pageName metaTitle metaDescription content createdAt } } }"#
      ))

    public var pageName: GraphQLNullable<String>

    public init(pageName: GraphQLNullable<String>) {
      self.pageName = pageName
    }

    public var __variables: Variables? { ["pageName": pageName] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getStaticPageContent", GetStaticPageContent?.self, arguments: ["pageName": .variable("pageName")]),
      ] }

      var getStaticPageContent: GetStaticPageContent? { __data["getStaticPageContent"] }

      /// GetStaticPageContent
      ///
      /// Parent Type: `StaticPageCommonType`
      struct GetStaticPageContent: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.StaticPageCommonType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("result", Result?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var result: Result? { __data["result"] }

        /// GetStaticPageContent.Result
        ///
        /// Parent Type: `StaticPageType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.StaticPageType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("pageName", String?.self),
            .field("metaTitle", String?.self),
            .field("metaDescription", String?.self),
            .field("content", String?.self),
            .field("createdAt", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var pageName: String? { __data["pageName"] }
          var metaTitle: String? { __data["metaTitle"] }
          var metaDescription: String? { __data["metaDescription"] }
          var content: String? { __data["content"] }
          var createdAt: String? { __data["createdAt"] }
        }
      }
    }
  }

}