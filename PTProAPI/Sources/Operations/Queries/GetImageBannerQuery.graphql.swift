// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetImageBannerQuery: GraphQLQuery {
  public static let operationName: String = "getImageBanner"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getImageBanner { getImageBanner { __typename result { __typename id title description buttonLabel image } status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getImageBanner", GetImageBanner?.self),
    ] }

    public var getImageBanner: GetImageBanner? { __data["getImageBanner"] }

    /// GetImageBanner
    ///
    /// Parent Type: `ImageBannerCommonType`
    public struct GetImageBanner: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ImageBannerCommonType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("result", Result?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: Result? { __data["result"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetImageBanner.Result
      ///
      /// Parent Type: `ImageBanner`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ImageBanner }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("title", String?.self),
          .field("description", String?.self),
          .field("buttonLabel", String?.self),
          .field("image", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var description: String? { __data["description"] }
        public var buttonLabel: String? { __data["buttonLabel"] }
        public var image: String? { __data["image"] }
      }
    }
  }
}
