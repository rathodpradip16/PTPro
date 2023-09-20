// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetPopularLocationsQuery: GraphQLQuery {
  public static let operationName: String = "getPopularLocations"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getPopularLocations { getPopularLocations { __typename results { __typename id location locationAddress image } status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getPopularLocations", GetPopularLocations?.self),
    ] }

    public var getPopularLocations: GetPopularLocations? { __data["getPopularLocations"] }

    /// GetPopularLocations
    ///
    /// Parent Type: `PopularLocationCommonType`
    public struct GetPopularLocations: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.PopularLocationCommonType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetPopularLocations.Result
      ///
      /// Parent Type: `PopularLocationListing`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.PopularLocationListing }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("location", String?.self),
          .field("locationAddress", String?.self),
          .field("image", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var location: String? { __data["location"] }
        public var locationAddress: String? { __data["locationAddress"] }
        public var image: String? { __data["image"] }
      }
    }
  }
}
