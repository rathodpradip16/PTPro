// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SearchListingQuery: GraphQLQuery {
    static let operationName: String = "SearchListing"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
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

      var searchListing: SearchListing? { __data["SearchListing"] }

      /// SearchListing
      ///
      /// Parent Type: `SearchListing`
      struct SearchListing: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SearchListing }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("currentPage", Int?.self),
          .field("count", Int?.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var currentPage: Int? { __data["currentPage"] }
        var count: Int? { __data["count"] }
        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// SearchListing.Result
        ///
        /// Parent Type: `ShowListing`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          static var __selections: [Apollo.Selection] { [
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

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var lat: Double? { __data["lat"] }
          var lng: Double? { __data["lng"] }
          var beds: Int? { __data["beds"] }
          var bookingType: String? { __data["bookingType"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
          var roomType: String? { __data["roomType"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingPhotos: [ListingPhoto?]? { __data["listingPhotos"] }
          var listingData: ListingData? { __data["listingData"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var isListOwner: Bool? { __data["isListOwner"] }

          /// SearchListing.Result.ListPhoto
          ///
          /// Parent Type: `ListPhotosData`
          struct ListPhoto: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("name", String?.self),
              .field("type", String?.self),
              .field("status", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var name: String? { __data["name"] }
            var type: String? { __data["type"] }
            var status: String? { __data["status"] }
          }

          /// SearchListing.Result.ListingPhoto
          ///
          /// Parent Type: `ListPhotosData`
          struct ListingPhoto: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("name", String?.self),
              .field("type", String?.self),
              .field("status", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var name: String? { __data["name"] }
            var type: String? { __data["type"] }
            var status: String? { __data["status"] }
          }

          /// SearchListing.Result.ListingData
          ///
          /// Parent Type: `ListingData`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("basePrice", Double?.self),
              .field("currency", String?.self),
            ] }

            var basePrice: Double? { __data["basePrice"] }
            var currency: String? { __data["currency"] }
          }

          /// SearchListing.Result.SettingsDatum
          ///
          /// Parent Type: `UserListingData`
          struct SettingsDatum: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("listsettings", Listsettings?.self),
            ] }

            var listsettings: Listsettings? { __data["listsettings"] }

            /// SearchListing.Result.SettingsDatum.Listsettings
            ///
            /// Parent Type: `SingleListSettings`
            struct Listsettings: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.SingleListSettings }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", Int?.self),
                .field("itemName", String?.self),
              ] }

              var id: Int? { __data["id"] }
              var itemName: String? { __data["itemName"] }
            }
          }
        }
      }
    }
  }

}