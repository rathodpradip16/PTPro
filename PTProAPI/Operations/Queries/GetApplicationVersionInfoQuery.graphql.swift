// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetApplicationVersionInfoQuery: GraphQLQuery {
    static let operationName: String = "getApplicationVersionInfo"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getApplicationVersionInfo($appType: String!, $version: String!) { getApplicationVersionInfo(appType: $appType, version: $version) { __typename status errorMessage result { __typename appStoreUrl playStoreUrl } } }"#
      ))

    public var appType: String
    public var version: String

    public init(
      appType: String,
      version: String
    ) {
      self.appType = appType
      self.version = version
    }

    public var __variables: Variables? { [
      "appType": appType,
      "version": version
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getApplicationVersionInfo", GetApplicationVersionInfo?.self, arguments: [
          "appType": .variable("appType"),
          "version": .variable("version")
        ]),
      ] }

      var getApplicationVersionInfo: GetApplicationVersionInfo? { __data["getApplicationVersionInfo"] }

      /// GetApplicationVersionInfo
      ///
      /// Parent Type: `SiteSettingsCommon`
      struct GetApplicationVersionInfo: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SiteSettingsCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("result", Result?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var result: Result? { __data["result"] }

        /// GetApplicationVersionInfo.Result
        ///
        /// Parent Type: `ApplicationVersion`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ApplicationVersion }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("appStoreUrl", String?.self),
            .field("playStoreUrl", String?.self),
          ] }

          var appStoreUrl: String? { __data["appStoreUrl"] }
          var playStoreUrl: String? { __data["playStoreUrl"] }
        }
      }
    }
  }

}