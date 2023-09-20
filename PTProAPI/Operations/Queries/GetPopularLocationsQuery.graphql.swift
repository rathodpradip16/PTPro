// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPopularLocationsQuery: GraphQLQuery {
    static let operationName: String = "getPopularLocations"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPopularLocations { getPopularLocations { __typename results { __typename id location locationAddress image } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPopularLocations", GetPopularLocations?.self),
      ] }

      var getPopularLocations: GetPopularLocations? { __data["getPopularLocations"] }

      /// GetPopularLocations
      ///
      /// Parent Type: `PopularLocationCommonType`
      struct GetPopularLocations: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.PopularLocationCommonType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetPopularLocations.Result
        ///
        /// Parent Type: `PopularLocationListing`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.PopularLocationListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("location", String?.self),
            .field("locationAddress", String?.self),
            .field("image", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var location: String? { __data["location"] }
          var locationAddress: String? { __data["locationAddress"] }
          var image: String? { __data["image"] }
        }
      }
    }
  }

}