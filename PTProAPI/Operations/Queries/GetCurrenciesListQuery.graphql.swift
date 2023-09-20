// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetCurrenciesListQuery: GraphQLQuery {
    static let operationName: String = "getCurrenciesList"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getCurrenciesList { getCurrencies { __typename results { __typename id symbol isEnable isPayment isBaseCurrency } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getCurrencies", GetCurrencies?.self),
      ] }

      var getCurrencies: GetCurrencies? { __data["getCurrencies"] }

      /// GetCurrencies
      ///
      /// Parent Type: `AllCurrenciesType`
      struct GetCurrencies: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllCurrenciesType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetCurrencies.Result
        ///
        /// Parent Type: `Currencies`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Currencies }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("symbol", String?.self),
            .field("isEnable", Bool?.self),
            .field("isPayment", Bool?.self),
            .field("isBaseCurrency", Bool?.self),
          ] }

          var id: Int? { __data["id"] }
          var symbol: String? { __data["symbol"] }
          var isEnable: Bool? { __data["isEnable"] }
          var isPayment: Bool? { __data["isPayment"] }
          var isBaseCurrency: Bool? { __data["isBaseCurrency"] }
        }
      }
    }
  }

}