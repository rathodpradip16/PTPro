// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetHostSuggestedQuery: GraphQLQuery {
    static let operationName: String = "getHostSuggested"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getHostSuggested($userId: String!, $currentPage: Int!, $priceRange: [Int]!, $review: String!) { getHostSuggested( userId: $userId currentPage: $currentPage priceRange: $priceRange review: $review ) { __typename count aaddress results { __typename id title personCapacity lat lng beds bookingType coverPhoto reviewsCount listPhotoName roomType reviewsStarRating listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } wishListStatus isListOwner } errorMessage status } }"#
      ))

    public var userId: String
    public var currentPage: Int
    public var priceRange: [Int?]
    public var review: String

    public init(
      userId: String,
      currentPage: Int,
      priceRange: [Int?],
      review: String
    ) {
      self.userId = userId
      self.currentPage = currentPage
      self.priceRange = priceRange
      self.review = review
    }

    public var __variables: Variables? { [
      "userId": userId,
      "currentPage": currentPage,
      "priceRange": priceRange,
      "review": review
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getHostSuggested", GetHostSuggested?.self, arguments: [
          "userId": .variable("userId"),
          "currentPage": .variable("currentPage"),
          "priceRange": .variable("priceRange"),
          "review": .variable("review")
        ]),
      ] }

      var getHostSuggested: GetHostSuggested? { __data["getHostSuggested"] }

      /// GetHostSuggested
      ///
      /// Parent Type: `HostSuggested`
      struct GetHostSuggested: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.HostSuggested }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("count", Int?.self),
          .field("aaddress", String?.self),
          .field("results", [Result?]?.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
        ] }

        var count: Int? { __data["count"] }
        var aaddress: String? { __data["aaddress"] }
        var results: [Result?]? { __data["results"] }
        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }

        /// GetHostSuggested.Result
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
            .field("reviewsCount", Int?.self),
            .field("listPhotoName", String?.self),
            .field("roomType", String?.self),
            .field("reviewsStarRating", Int?.self),
            .field("listPhotos", [ListPhoto?]?.self),
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
          var reviewsCount: Int? { __data["reviewsCount"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var roomType: String? { __data["roomType"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingData: ListingData? { __data["listingData"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var isListOwner: Bool? { __data["isListOwner"] }

          /// GetHostSuggested.Result.ListPhoto
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

          /// GetHostSuggested.Result.ListingData
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

          /// GetHostSuggested.Result.SettingsDatum
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

            /// GetHostSuggested.Result.SettingsDatum.Listsettings
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