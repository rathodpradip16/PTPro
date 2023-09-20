// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetApplicationVersionInfoQuery: GraphQLQuery {
  public static let operationName: String = "getApplicationVersionInfo"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getApplicationVersionInfo", GetApplicationVersionInfo?.self, arguments: [
        "appType": .variable("appType"),
        "version": .variable("version")
      ]),
    ] }

    public var getApplicationVersionInfo: GetApplicationVersionInfo? { __data["getApplicationVersionInfo"] }

    /// GetApplicationVersionInfo
    ///
    /// Parent Type: `SiteSettingsCommon`
    public struct GetApplicationVersionInfo: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.SiteSettingsCommon }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("result", Result?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var result: Result? { __data["result"] }

      /// GetApplicationVersionInfo.Result
      ///
      /// Parent Type: `ApplicationVersion`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ApplicationVersion }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("appStoreUrl", String?.self),
          .field("playStoreUrl", String?.self),
        ] }

        public var appStoreUrl: String? { __data["appStoreUrl"] }
        public var playStoreUrl: String? { __data["playStoreUrl"] }
      }
    }
  }
}
