// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetSimilarListingQuery: GraphQLQuery {
  public static let operationName: String = "getSimilarListing"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getSimilarListing($lat: Float, $lng: Float, $listId: Int) { getSimilarListing(listId: $listId, lat: $lat, lng: $lng) { __typename results { __typename id title personCapacity beds bookingType reviewsCount reviewsStarRating listingData { __typename basePrice currency cleaningPrice } wishListStatus isListOwner listPhotoName roomType } status } }"#
    ))

  public var lat: GraphQLNullable<Double>
  public var lng: GraphQLNullable<Double>
  public var listId: GraphQLNullable<Int>

  public init(
    lat: GraphQLNullable<Double>,
    lng: GraphQLNullable<Double>,
    listId: GraphQLNullable<Int>
  ) {
    self.lat = lat
    self.lng = lng
    self.listId = listId
  }

  public var __variables: Variables? { [
    "lat": lat,
    "lng": lng,
    "listId": listId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getSimilarListing", GetSimilarListing?.self, arguments: [
        "listId": .variable("listId"),
        "lat": .variable("lat"),
        "lng": .variable("lng")
      ]),
    ] }

    public var getSimilarListing: GetSimilarListing? { __data["getSimilarListing"] }

    /// GetSimilarListing
    ///
    /// Parent Type: `AllList`
    public struct GetSimilarListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllList }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }

      /// GetSimilarListing.Result
      ///
      /// Parent Type: `ShowListing`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("title", String?.self),
          .field("personCapacity", Int?.self),
          .field("beds", Int?.self),
          .field("bookingType", String?.self),
          .field("reviewsCount", Int?.self),
          .field("reviewsStarRating", Int?.self),
          .field("listingData", ListingData?.self),
          .field("wishListStatus", Bool?.self),
          .field("isListOwner", Bool?.self),
          .field("listPhotoName", String?.self),
          .field("roomType", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var beds: Int? { __data["beds"] }
        public var bookingType: String? { __data["bookingType"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var wishListStatus: Bool? { __data["wishListStatus"] }
        public var isListOwner: Bool? { __data["isListOwner"] }
        public var listPhotoName: String? { __data["listPhotoName"] }
        public var roomType: String? { __data["roomType"] }

        /// GetSimilarListing.Result.ListingData
        ///
        /// Parent Type: `ListingData`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("basePrice", Double?.self),
            .field("currency", String?.self),
            .field("cleaningPrice", Double?.self),
          ] }

          public var basePrice: Double? { __data["basePrice"] }
          public var currency: String? { __data["currency"] }
          public var cleaningPrice: Double? { __data["cleaningPrice"] }
        }
      }
    }
  }
}