// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetStaticPageContentQuery: GraphQLQuery {
  public static let operationName: String = "getStaticPageContent"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getStaticPageContent($id: Int) { getStaticPageContent(id: $id) { __typename status errorMessage result { __typename id pageName metaTitle metaDescription content createdAt } } }"#
    ))

  public var id: GraphQLNullable<Int>

  public init(id: GraphQLNullable<Int>) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getStaticPageContent", GetStaticPageContent?.self, arguments: ["id": .variable("id")]),
    ] }

    public var getStaticPageContent: GetStaticPageContent? { __data["getStaticPageContent"] }

    /// GetStaticPageContent
    ///
    /// Parent Type: `StaticPageCommonType`
    public struct GetStaticPageContent: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.StaticPageCommonType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("result", Result?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var result: Result? { __data["result"] }

      /// GetStaticPageContent.Result
      ///
      /// Parent Type: `StaticPageType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.StaticPageType }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("pageName", String?.self),
          .field("metaTitle", String?.self),
          .field("metaDescription", String?.self),
          .field("content", String?.self),
          .field("createdAt", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var pageName: String? { __data["pageName"] }
        public var metaTitle: String? { __data["metaTitle"] }
        public var metaDescription: String? { __data["metaDescription"] }
        public var content: String? { __data["content"] }
        public var createdAt: String? { __data["createdAt"] }
      }
    }
  }
}
