// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPaymentSettingsQuery: GraphQLQuery {
    static let operationName: String = "getPaymentSettings"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPaymentSettings { getPaymentSettings { __typename status errorMessage result { __typename secretKey publishableKey } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPaymentSettings", GetPaymentSettings?.self),
      ] }

      var getPaymentSettings: GetPaymentSettings? { __data["getPaymentSettings"] }

      /// GetPaymentSettings
      ///
      /// Parent Type: `GetPaymentKey`
      struct GetPaymentSettings: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPaymentKey }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("result", Result?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var result: Result? { __data["result"] }

        /// GetPaymentSettings.Result
        ///
        /// Parent Type: `StripeKeysType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.StripeKeysType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("secretKey", String?.self),
            .field("publishableKey", String?.self),
          ] }

          var secretKey: String? { __data["secretKey"] }
          var publishableKey: String? { __data["publishableKey"] }
        }
      }
    }
  }

}