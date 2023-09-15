// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCountrycodeQuery: GraphQLQuery {
  public static let operationName: String = "getCountrycode"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getCountrycode {
        getCountries {
          __typename
          errorMessage
          status
          results {
            __typename
            id
            isEnable
            countryCode
            countryName
            dialCode
          }
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
      .field("getCountries", GetCountries?.self),
    ] }

    public var getCountries: GetCountries? { __data["getCountries"] }

    /// GetCountries
    ///
    /// Parent Type: `AllCountry`
    public struct GetCountries: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllCountry }
      public static var __selections: [Selection] { [
        .field("errorMessage", String?.self),
        .field("status", Int?.self),
        .field("results", [Result?]?.self),
      ] }

      public var errorMessage: String? { __data["errorMessage"] }
      public var status: Int? { __data["status"] }
      public var results: [Result?]? { __data["results"] }

      /// GetCountries.Result
      ///
      /// Parent Type: `Country`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.Country }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("isEnable", Bool?.self),
          .field("countryCode", String?.self),
          .field("countryName", String?.self),
          .field("dialCode", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var isEnable: Bool? { __data["isEnable"] }
        public var countryCode: String? { __data["countryCode"] }
        public var countryName: String? { __data["countryName"] }
        public var dialCode: String? { __data["dialCode"] }
      }
    }
  }
}
