// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ViewListingDetailsQuery: GraphQLQuery {
    static let operationName: String = "viewListingDetails"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query viewListingDetails($listId: Int!, $preview: Boolean) { viewListing(listId: $listId, preview: $preview) { __typename results { __typename id userId title residenceType description coverPhoto city state country isPublished lat lng houseType roomType bookingType bedrooms beds personCapacity bathrooms coverPhoto listPhotoName userBedsTypes { __typename bedCount bedName } listPhotos { __typename id name } listingPhotos { __typename id name } user { __typename email profile { __typename profileId displayName picture firstName } } userAmenities { __typename id image itemName } userSafetyAmenities { __typename id image itemName } userSpaces { __typename id image itemName } houseRules { __typename id image itemName } settingsData { __typename listsettings { __typename id itemName settingsType { __typename typeName } } } listingData { __typename bookingNoticeTime checkInStart checkInEnd maxDaysNotice minNight maxNight basePrice cleaningPrice currency weeklyDiscount monthlyDiscount cancellation { __typename id policyName policyContent } } blockedDates { __typename blockedDates reservationId calendarStatus isSpecialPrice listId dayStatus } checkInBlockedDates { __typename listId blockedDates calendarStatus isSpecialPrice dayStatus } fullBlockedDates { __typename listId blockedDates calendarStatus isSpecialPrice dayStatus } reviewsCount reviewsStarRating isListOwner wishListStatus wishListGroupCount } status errorMessage } }"#
      ))

    public var listId: Int
    public var preview: GraphQLNullable<Bool>

    public init(
      listId: Int,
      preview: GraphQLNullable<Bool>
    ) {
      self.listId = listId
      self.preview = preview
    }

    public var __variables: Variables? { [
      "listId": listId,
      "preview": preview
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("viewListing", ViewListing?.self, arguments: [
          "listId": .variable("listId"),
          "preview": .variable("preview")
        ]),
      ] }

      var viewListing: ViewListing? { __data["viewListing"] }

      /// ViewListing
      ///
      /// Parent Type: `AllListing`
      struct ViewListing: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListing }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// ViewListing.Results
        ///
        /// Parent Type: `ShowListing`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("userId", String?.self),
            .field("title", String?.self),
            .field("residenceType", String?.self),
            .field("description", String?.self),
            .field("coverPhoto", Int?.self),
            .field("city", String?.self),
            .field("state", String?.self),
            .field("country", String?.self),
            .field("isPublished", Bool?.self),
            .field("lat", Double?.self),
            .field("lng", Double?.self),
            .field("houseType", String?.self),
            .field("roomType", String?.self),
            .field("bookingType", String?.self),
            .field("bedrooms", String?.self),
            .field("beds", Int?.self),
            .field("personCapacity", Int?.self),
            .field("bathrooms", Double?.self),
            .field("listPhotoName", String?.self),
            .field("userBedsTypes", [UserBedsType?]?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingPhotos", [ListingPhoto?]?.self),
            .field("user", User?.self),
            .field("userAmenities", [UserAmenity?]?.self),
            .field("userSafetyAmenities", [UserSafetyAmenity?]?.self),
            .field("userSpaces", [UserSpace?]?.self),
            .field("houseRules", [HouseRule?]?.self),
            .field("settingsData", [SettingsDatum?]?.self),
            .field("listingData", ListingData?.self),
            .field("blockedDates", [BlockedDate?]?.self),
            .field("checkInBlockedDates", [CheckInBlockedDate?]?.self),
            .field("fullBlockedDates", [FullBlockedDate?]?.self),
            .field("reviewsCount", Int?.self),
            .field("reviewsStarRating", Int?.self),
            .field("isListOwner", Bool?.self),
            .field("wishListStatus", Bool?.self),
            .field("wishListGroupCount", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var title: String? { __data["title"] }
          var residenceType: String? { __data["residenceType"] }
          var description: String? { __data["description"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
          var city: String? { __data["city"] }
          var state: String? { __data["state"] }
          var country: String? { __data["country"] }
          var isPublished: Bool? { __data["isPublished"] }
          var lat: Double? { __data["lat"] }
          var lng: Double? { __data["lng"] }
          var houseType: String? { __data["houseType"] }
          var roomType: String? { __data["roomType"] }
          var bookingType: String? { __data["bookingType"] }
          var bedrooms: String? { __data["bedrooms"] }
          var beds: Int? { __data["beds"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var bathrooms: Double? { __data["bathrooms"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var userBedsTypes: [UserBedsType?]? { __data["userBedsTypes"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingPhotos: [ListingPhoto?]? { __data["listingPhotos"] }
          var user: User? { __data["user"] }
          var userAmenities: [UserAmenity?]? { __data["userAmenities"] }
          var userSafetyAmenities: [UserSafetyAmenity?]? { __data["userSafetyAmenities"] }
          var userSpaces: [UserSpace?]? { __data["userSpaces"] }
          var houseRules: [HouseRule?]? { __data["houseRules"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var listingData: ListingData? { __data["listingData"] }
          var blockedDates: [BlockedDate?]? { __data["blockedDates"] }
          var checkInBlockedDates: [CheckInBlockedDate?]? { __data["checkInBlockedDates"] }
          var fullBlockedDates: [FullBlockedDate?]? { __data["fullBlockedDates"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var isListOwner: Bool? { __data["isListOwner"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var wishListGroupCount: Int? { __data["wishListGroupCount"] }

          /// ViewListing.Results.UserBedsType
          ///
          /// Parent Type: `BedTypes`
          struct UserBedsType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.BedTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("bedCount", Int?.self),
              .field("bedName", String?.self),
            ] }

            var bedCount: Int? { __data["bedCount"] }
            var bedName: String? { __data["bedName"] }
          }

          /// ViewListing.Results.ListPhoto
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
            ] }

            var id: Int? { __data["id"] }
            var name: String? { __data["name"] }
          }

          /// ViewListing.Results.ListingPhoto
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
            ] }

            var id: Int? { __data["id"] }
            var name: String? { __data["name"] }
          }

          /// ViewListing.Results.User
          ///
          /// Parent Type: `User`
          struct User: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.User }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("email", String?.self),
              .field("profile", Profile?.self),
            ] }

            var email: String? { __data["email"] }
            var profile: Profile? { __data["profile"] }

            /// ViewListing.Results.User.Profile
            ///
            /// Parent Type: `Profile`
            struct Profile: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Profile }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("profileId", Int?.self),
                .field("displayName", String?.self),
                .field("picture", String?.self),
                .field("firstName", String?.self),
              ] }

              var profileId: Int? { __data["profileId"] }
              var displayName: String? { __data["displayName"] }
              var picture: String? { __data["picture"] }
              var firstName: String? { __data["firstName"] }
            }
          }

          /// ViewListing.Results.UserAmenity
          ///
          /// Parent Type: `AllListSettingTypes`
          struct UserAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("image", String?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var image: String? { __data["image"] }
            var itemName: String? { __data["itemName"] }
          }

          /// ViewListing.Results.UserSafetyAmenity
          ///
          /// Parent Type: `AllListSettingTypes`
          struct UserSafetyAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("image", String?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var image: String? { __data["image"] }
            var itemName: String? { __data["itemName"] }
          }

          /// ViewListing.Results.UserSpace
          ///
          /// Parent Type: `AllListSettingTypes`
          struct UserSpace: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("image", String?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var image: String? { __data["image"] }
            var itemName: String? { __data["itemName"] }
          }

          /// ViewListing.Results.HouseRule
          ///
          /// Parent Type: `AllListSettingTypes`
          struct HouseRule: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("image", String?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var image: String? { __data["image"] }
            var itemName: String? { __data["itemName"] }
          }

          /// ViewListing.Results.SettingsDatum
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

            /// ViewListing.Results.SettingsDatum.Listsettings
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
                .field("settingsType", SettingsType?.self),
              ] }

              var id: Int? { __data["id"] }
              var itemName: String? { __data["itemName"] }
              var settingsType: SettingsType? { __data["settingsType"] }

              /// ViewListing.Results.SettingsDatum.Listsettings.SettingsType
              ///
              /// Parent Type: `ListSettingsTypes`
              struct SettingsType: PTProAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListSettingsTypes }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("typeName", String?.self),
                ] }

                var typeName: String? { __data["typeName"] }
              }
            }
          }

          /// ViewListing.Results.ListingData
          ///
          /// Parent Type: `ListingData`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("bookingNoticeTime", String?.self),
              .field("checkInStart", String?.self),
              .field("checkInEnd", String?.self),
              .field("maxDaysNotice", String?.self),
              .field("minNight", Int?.self),
              .field("maxNight", Int?.self),
              .field("basePrice", Double?.self),
              .field("cleaningPrice", Double?.self),
              .field("currency", String?.self),
              .field("weeklyDiscount", Int?.self),
              .field("monthlyDiscount", Int?.self),
              .field("cancellation", Cancellation?.self),
            ] }

            var bookingNoticeTime: String? { __data["bookingNoticeTime"] }
            var checkInStart: String? { __data["checkInStart"] }
            var checkInEnd: String? { __data["checkInEnd"] }
            var maxDaysNotice: String? { __data["maxDaysNotice"] }
            var minNight: Int? { __data["minNight"] }
            var maxNight: Int? { __data["maxNight"] }
            var basePrice: Double? { __data["basePrice"] }
            var cleaningPrice: Double? { __data["cleaningPrice"] }
            var currency: String? { __data["currency"] }
            var weeklyDiscount: Int? { __data["weeklyDiscount"] }
            var monthlyDiscount: Int? { __data["monthlyDiscount"] }
            var cancellation: Cancellation? { __data["cancellation"] }

            /// ViewListing.Results.ListingData.Cancellation
            ///
            /// Parent Type: `Cancellation`
            struct Cancellation: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Cancellation }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", Int?.self),
                .field("policyName", String?.self),
                .field("policyContent", String?.self),
              ] }

              var id: Int? { __data["id"] }
              var policyName: String? { __data["policyName"] }
              var policyContent: String? { __data["policyContent"] }
            }
          }

          /// ViewListing.Results.BlockedDate
          ///
          /// Parent Type: `ListBlockedDates`
          struct BlockedDate: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("blockedDates", String?.self),
              .field("reservationId", Int?.self),
              .field("calendarStatus", String?.self),
              .field("isSpecialPrice", Double?.self),
              .field("listId", Int?.self),
              .field("dayStatus", String?.self),
            ] }

            var blockedDates: String? { __data["blockedDates"] }
            var reservationId: Int? { __data["reservationId"] }
            var calendarStatus: String? { __data["calendarStatus"] }
            var isSpecialPrice: Double? { __data["isSpecialPrice"] }
            var listId: Int? { __data["listId"] }
            var dayStatus: String? { __data["dayStatus"] }
          }

          /// ViewListing.Results.CheckInBlockedDate
          ///
          /// Parent Type: `ListBlockedDates`
          struct CheckInBlockedDate: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("listId", Int?.self),
              .field("blockedDates", String?.self),
              .field("calendarStatus", String?.self),
              .field("isSpecialPrice", Double?.self),
              .field("dayStatus", String?.self),
            ] }

            var listId: Int? { __data["listId"] }
            var blockedDates: String? { __data["blockedDates"] }
            var calendarStatus: String? { __data["calendarStatus"] }
            var isSpecialPrice: Double? { __data["isSpecialPrice"] }
            var dayStatus: String? { __data["dayStatus"] }
          }

          /// ViewListing.Results.FullBlockedDate
          ///
          /// Parent Type: `ListBlockedDates`
          struct FullBlockedDate: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("listId", Int?.self),
              .field("blockedDates", String?.self),
              .field("calendarStatus", String?.self),
              .field("isSpecialPrice", Double?.self),
              .field("dayStatus", String?.self),
            ] }

            var listId: Int? { __data["listId"] }
            var blockedDates: String? { __data["blockedDates"] }
            var calendarStatus: String? { __data["calendarStatus"] }
            var isSpecialPrice: Double? { __data["isSpecialPrice"] }
            var dayStatus: String? { __data["dayStatus"] }
          }
        }
      }
    }
  }

}
