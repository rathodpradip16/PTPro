// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCurrenciesListQuery: GraphQLQuery {
  public static let operationName: String = "getCurrenciesList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getCurrenciesList { getCurrencies { __typename results { __typename id symbol isEnable isPayment isBaseCurrency } status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getCurrencies", GetCurrencies?.self),
    ] }

    public var getCurrencies: GetCurrencies? { __data["getCurrencies"] }

    /// GetCurrencies
    ///
    /// Parent Type: `AllCurrenciesType`
    public struct GetCurrencies: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllCurrenciesType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetCurrencies.Result
      ///
      /// Parent Type: `Currencies`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Currencies }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("symbol", String?.self),
          .field("isEnable", Bool?.self),
          .field("isPayment", Bool?.self),
          .field("isBaseCurrency", Bool?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var symbol: String? { __data["symbol"] }
        public var isEnable: Bool? { __data["isEnable"] }
        public var isPayment: Bool? { __data["isPayment"] }
        public var isBaseCurrency: Bool? { __data["isBaseCurrency"] }
      }
    }
  }
}
