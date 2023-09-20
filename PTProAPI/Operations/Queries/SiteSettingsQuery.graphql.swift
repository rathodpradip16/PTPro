// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SiteSettingsQuery: GraphQLQuery {
    static let operationName: String = "siteSettings"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query siteSettings($type: String) { siteSettings(type: $type) { __typename status errorMessage results { __typename id title name value type status } } }"#
      ))

    public var type: GraphQLNullable<String>

    public init(type: GraphQLNullable<String>) {
      self.type = type
    }

    public var __variables: Variables? { ["type": type] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("siteSettings", SiteSettings?.self, arguments: ["type": .variable("type")]),
      ] }

      var siteSettings: SiteSettings? { __data["siteSettings"] }

      /// SiteSettings
      ///
      /// Parent Type: `SiteSettingsCommon`
      struct SiteSettings: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SiteSettingsCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: [Result?]? { __data["results"] }

        /// SiteSettings.Result
        ///
        /// Parent Type: `SiteSettings`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.SiteSettings }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("name", String?.self),
            .field("value", String?.self),
            .field("type", String?.self),
            .field("status", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var name: String? { __data["name"] }
          var value: String? { __data["value"] }
          var type: String? { __data["type"] }
          var status: String? { __data["status"] }
        }
      }
    }
  }

}