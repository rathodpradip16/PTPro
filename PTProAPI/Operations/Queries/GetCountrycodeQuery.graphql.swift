// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetCountrycodeQuery: GraphQLQuery {
    static let operationName: String = "getCountrycode"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getCountrycode { getCountries { __typename errorMessage status results { __typename id isEnable countryCode countryName dialCode } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getCountries", GetCountries?.self),
      ] }

      var getCountries: GetCountries? { __data["getCountries"] }

      /// GetCountries
      ///
      /// Parent Type: `AllCountry`
      struct GetCountries: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllCountry }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("results", [Result?]?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var results: [Result?]? { __data["results"] }

        /// GetCountries.Result
        ///
        /// Parent Type: `Country`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Country }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("isEnable", Bool?.self),
            .field("countryCode", String?.self),
            .field("countryName", String?.self),
            .field("dialCode", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var isEnable: Bool? { __data["isEnable"] }
          var countryCode: String? { __data["countryCode"] }
          var countryName: String? { __data["countryName"] }
          var dialCode: String? { __data["dialCode"] }
        }
      }
    }
  }

}