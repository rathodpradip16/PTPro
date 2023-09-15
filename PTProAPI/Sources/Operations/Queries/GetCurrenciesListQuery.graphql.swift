// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCurrenciesListQuery: GraphQLQuery {
  public static let operationName: String = "getCurrenciesList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getCurrenciesList {
        getCurrencies {
          __typename
          results {
            __typename
            id
            symbol
            isEnable
            isPayment
            isBaseCurrency
          }
          status
          errorMessage
        }
      }
      """
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getCurrencies", GetCurrencies?.self),
    ] }

    public var getCurrencies: GetCurrencies? { __data["getCurrencies"] }

    /// GetCurrencies
    ///
    /// Parent Type: `AllCurrenciesType`
    public struct GetCurrencies: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllCurrenciesType }
      public static var __selections: [Selection] { [
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
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.Currencies }
        public static var __selections: [Selection] { [
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
