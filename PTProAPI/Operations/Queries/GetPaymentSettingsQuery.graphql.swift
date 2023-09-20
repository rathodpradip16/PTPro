// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetPaymentSettingsQuery: GraphQLQuery {
  public static let operationName: String = "getPaymentSettings"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getPaymentSettings { getPaymentSettings { __typename status errorMessage result { __typename secretKey publishableKey } } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getPaymentSettings", GetPaymentSettings?.self),
    ] }

    public var getPaymentSettings: GetPaymentSettings? { __data["getPaymentSettings"] }

    /// GetPaymentSettings
    ///
    /// Parent Type: `GetPaymentKey`
    public struct GetPaymentSettings: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPaymentKey }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("result", Result?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var result: Result? { __data["result"] }

      /// GetPaymentSettings.Result
      ///
      /// Parent Type: `StripeKeysType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.StripeKeysType }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("secretKey", String?.self),
          .field("publishableKey", String?.self),
        ] }

        public var secretKey: String? { __data["secretKey"] }
        public var publishableKey: String? { __data["publishableKey"] }
      }
    }
  }
}
