// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class SearchListingQuery: GraphQLQuery {
  public static let operationName: String = "SearchListing"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query SearchListing($personCapacity: Int, $currentPage: Int, $dates: String, $lat: Float, $lng: Float, $amenities: [Int], $beds: Int, $bedrooms: Int, $bathrooms: Int, $roomType: [Int], $spaces: [Int], $houseRules: [Int], $priceRange: [Int], $geoType: String, $geography: String, $bookingType: String, $address: String, $currency: String) { SearchListing( personCapacity: $personCapacity currentPage: $currentPage dates: $dates lat: $lat lng: $lng amenities: $amenities beds: $beds bedrooms: $bedrooms bathrooms: $bathrooms roomType: $roomType spaces: $spaces houseRules: $houseRules priceRange: $priceRange geoType: $geoType geography: $geography bookingType: $bookingType address: $address currency: $currency ) { __typename currentPage count results { __typename id title personCapacity lat lng beds bookingType coverPhoto roomType reviewsCount reviewsStarRating listPhotoName listPhotos { __typename id name type status } listingPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } wishListStatus isListOwner } status errorMessage } }"#
    ))

  public var personCapacity: GraphQLNullable<Int>
  public var currentPage: GraphQLNullable<Int>
  public var dates: GraphQLNullable<String>
  public var lat: GraphQLNullable<Double>
  public var lng: GraphQLNullable<Double>
  public var amenities: GraphQLNullable<[Int?]>
  public var beds: GraphQLNullable<Int>
  public var bedrooms: GraphQLNullable<Int>
  public var bathrooms: GraphQLNullable<Int>
  public var roomType: GraphQLNullable<[Int?]>
  public var spaces: GraphQLNullable<[Int?]>
  public var houseRules: GraphQLNullable<[Int?]>
  public var priceRange: GraphQLNullable<[Int?]>
  public var geoType: GraphQLNullable<String>
  public var geography: GraphQLNullable<String>
  public var bookingType: GraphQLNullable<String>
  public var address: GraphQLNullable<String>
  public var currency: GraphQLNullable<String>

  public init(
    personCapacity: GraphQLNullable<Int>,
    currentPage: GraphQLNullable<Int>,
    dates: GraphQLNullable<String>,
    lat: GraphQLNullable<Double>,
    lng: GraphQLNullable<Double>,
    amenities: GraphQLNullable<[Int?]>,
    beds: GraphQLNullable<Int>,
    bedrooms: GraphQLNullable<Int>,
    bathrooms: GraphQLNullable<Int>,
    roomType: GraphQLNullable<[Int?]>,
    spaces: GraphQLNullable<[Int?]>,
    houseRules: GraphQLNullable<[Int?]>,
    priceRange: GraphQLNullable<[Int?]>,
    geoType: GraphQLNullable<String>,
    geography: GraphQLNullable<String>,
    bookingType: GraphQLNullable<String>,
    address: GraphQLNullable<String>,
    currency: GraphQLNullable<String>
  ) {
    self.personCapacity = personCapacity
    self.currentPage = currentPage
    self.dates = dates
    self.lat = lat
    self.lng = lng
    self.amenities = amenities
    self.beds = beds
    self.bedrooms = bedrooms
    self.bathrooms = bathrooms
    self.roomType = roomType
    self.spaces = spaces
    self.houseRules = houseRules
    self.priceRange = priceRange
    self.geoType = geoType
    self.geography = geography
    self.bookingType = bookingType
    self.address = address
    self.currency = currency
  }

  public var __variables: Variables? { [
    "personCapacity": personCapacity,
    "currentPage": currentPage,
    "dates": dates,
    "lat": lat,
    "lng": lng,
    "amenities": amenities,
    "beds": beds,
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "roomType": roomType,
    "spaces": spaces,
    "houseRules": houseRules,
    "priceRange": priceRange,
    "geoType": geoType,
    "geography": geography,
    "bookingType": bookingType,
    "address": address,
    "currency": currency
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("SearchListing", SearchListing?.self, arguments: [
        "personCapacity": .variable("personCapacity"),
        "currentPage": .variable("currentPage"),
        "dates": .variable("dates"),
        "lat": .variable("lat"),
        "lng": .variable("lng"),
        "amenities": .variable("amenities"),
        "beds": .variable("beds"),
        "bedrooms": .variable("bedrooms"),
        "bathrooms": .variable("bathrooms"),
        "roomType": .variable("roomType"),
        "spaces": .variable("spaces"),
        "houseRules": .variable("houseRules"),
        "priceRange": .variable("priceRange"),
        "geoType": .variable("geoType"),
        "geography": .variable("geography"),
        "bookingType": .variable("bookingType"),
        "address": .variable("address"),
        "currency": .variable("currency")
      ]),
    ] }

    public var searchListing: SearchListing? { __data["SearchListing"] }

    /// SearchListing
    ///
    /// Parent Type: `SearchListing`
    public struct SearchListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.SearchListing }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("currentPage", Int?.self),
        .field("count", Int?.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var currentPage: Int? { __data["currentPage"] }
      public var count: Int? { __data["count"] }
      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// SearchListing.Result
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
          .field("lat", Double?.self),
          .field("lng", Double?.self),
          .field("beds", Int?.self),
          .field("bookingType", String?.self),
          .field("coverPhoto", Int?.self),
          .field("roomType", String?.self),
          .field("reviewsCount", Int?.self),
          .field("reviewsStarRating", Int?.self),
          .field("listPhotoName", String?.self),
          .field("listPhotos", [ListPhoto?]?.self),
          .field("listingPhotos", [ListingPhoto?]?.self),
          .field("listingData", ListingData?.self),
          .field("settingsData", [SettingsDatum?]?.self),
          .field("wishListStatus", Bool?.self),
          .field("isListOwner", Bool?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var lat: Double? { __data["lat"] }
        public var lng: Double? { __data["lng"] }
        public var beds: Int? { __data["beds"] }
        public var bookingType: String? { __data["bookingType"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
        public var roomType: String? { __data["roomType"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
        public var listPhotoName: String? { __data["listPhotoName"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingPhotos: [ListingPhoto?]? { __data["listingPhotos"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var settingsData: [SettingsDatum?]? { __data["settingsData"] }
        public var wishListStatus: Bool? { __data["wishListStatus"] }
        public var isListOwner: Bool? { __data["isListOwner"] }

        /// SearchListing.Result.ListPhoto
        ///
        /// Parent Type: `ListPhotosData`
        public struct ListPhoto: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosData }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("status", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
          public var status: String? { __data["status"] }
        }

        /// SearchListing.Result.ListingPhoto
        ///
        /// Parent Type: `ListPhotosData`
        public struct ListingPhoto: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosData }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("status", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
          public var status: String? { __data["status"] }
        }

        /// SearchListing.Result.ListingData
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
          ] }

          public var basePrice: Double? { __data["basePrice"] }
          public var currency: String? { __data["currency"] }
        }

        /// SearchListing.Result.SettingsDatum
        ///
        /// Parent Type: `UserListingData`
        public struct SettingsDatum: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("listsettings", Listsettings?.self),
          ] }

          public var listsettings: Listsettings? { __data["listsettings"] }

          /// SearchListing.Result.SettingsDatum.Listsettings
          ///
          /// Parent Type: `SingleListSettings`
          public struct Listsettings: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.SingleListSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("itemName", String?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var itemName: String? { __data["itemName"] }
          }
        }
      }
    }
  }
}
