// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetSimilarListingQuery: GraphQLQuery {
    static let operationName: String = "getSimilarListing"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getSimilarListing", GetSimilarListing?.self, arguments: [
          "listId": .variable("listId"),
          "lat": .variable("lat"),
          "lng": .variable("lng")
        ]),
      ] }

      var getSimilarListing: GetSimilarListing? { __data["getSimilarListing"] }

      /// GetSimilarListing
      ///
      /// Parent Type: `AllList`
      struct GetSimilarListing: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllList }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }

        /// GetSimilarListing.Result
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

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var beds: Int? { __data["beds"] }
          var bookingType: String? { __data["bookingType"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var listingData: ListingData? { __data["listingData"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var isListOwner: Bool? { __data["isListOwner"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var roomType: String? { __data["roomType"] }

          /// GetSimilarListing.Result.ListingData
          ///
          /// Parent Type: `ListingDatas`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingDatas }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("basePrice", Double?.self),
              .field("currency", String?.self),
              .field("cleaningPrice", Double?.self),
            ] }

            var basePrice: Double? { __data["basePrice"] }
            var currency: String? { __data["currency"] }
            var cleaningPrice: Double? { __data["cleaningPrice"] }
          }
        }
      }
    }
  }

}