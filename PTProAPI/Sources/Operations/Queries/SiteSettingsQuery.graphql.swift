// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SiteSettingsQuery: GraphQLQuery {
  public static let operationName: String = "siteSettings"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query siteSettings($type: String) { siteSettings(type: $type) { __typename status errorMessage results { __typename id title name value type status } } }"#
    ))

  public var type: GraphQLNullable<String>

  public init(type: GraphQLNullable<String>) {
    self.type = type
  }

  public var __variables: Variables? { ["type": type] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("siteSettings", SiteSettings?.self, arguments: ["type": .variable("type")]),
    ] }

    public var siteSettings: SiteSettings? { __data["siteSettings"] }

    /// SiteSettings
    ///
    /// Parent Type: `SiteSettingsCommon`
    public struct SiteSettings: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SiteSettingsCommon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: [Result?]? { __data["results"] }

      /// SiteSettings.Result
      ///
      /// Parent Type: `SiteSettings`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SiteSettings }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("title", String?.self),
          .field("name", String?.self),
          .field("value", String?.self),
          .field("type", String?.self),
          .field("status", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var name: String? { __data["name"] }
        public var value: String? { __data["value"] }
        public var type: String? { __data["type"] }
        public var status: String? { __data["status"] }
      }
    }
  }
}
