// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ViewListingDetailsQuery: GraphQLQuery {
    static let operationName: String = "viewListingDetails"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query viewListingDetails($listId: Int!, $preview: Boolean) { viewListing(listId: $listId, preview: $preview) { __typename results { __typename id userId title description coverPhoto city state country isPublished lat lng houseType roomType bookingType bedrooms checkInBlockedDates { __typename listId blockedDates calendarStatus isSpecialPrice dayStatus } fullBlockedDates { __typename listId blockedDates calendarStatus isSpecialPrice dayStatus } userBedsTypes { __typename bedCount bedName } residenceType beds personCapacity bathrooms coverPhoto listPhotoName settingsData { __typename listsettings { __typename id itemName settingsType { __typename typeName } } } listPhotos { __typename id name } user { __typename email profile { __typename profileId displayName firstName picture } } userAmenities { __typename id itemName image } userSafetyAmenities { __typename id itemName image } userSpaces { __typename id itemName } houseRules { __typename isAgeSelected isEventSelected isPetSelected isChildrenSelected isSmokingSelected age { __typename age } event { __typename isBirthDay isFamilyGathering isOtherSelcted otherDetails attendees } pet { __typename petNo isDogAllowed isCatAllowed anypet petSize } children { __typename twoyears twelveyears seventeenyears } smoking { __typename indoors outDoors details } dynamicRules { __typename rule id isSelected isNoSelected Details } } listingData { __typename bookingNoticeTime checkInStart checkInEnd maxDaysNotice minNight maxNight basePrice cleaningPrice currency weeklyDiscount monthlyDiscount cancellation { __typename id policyName policyContent } petFee petSelected checkInEntrySelected checkInType texTypeId taxPercentage taxPersonAge taxAmount aboutHost { __typename isProfessional bdStreet bdApt bdCity bdState bdzipcode bdCountry bmFirstname bmLastname businessName } } blockedDates { __typename blockedDates reservationId calendarStatus isSpecialPrice listId dayStatus } reviewsCount reviewsStarRating isListOwner wishListStatus wishListGroupCount } status errorMessage } }"#
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
            .field("checkInBlockedDates", [CheckInBlockedDate?]?.self),
            .field("fullBlockedDates", [FullBlockedDate?]?.self),
            .field("userBedsTypes", [UserBedsType?]?.self),
            .field("residenceType", String?.self),
            .field("beds", Int?.self),
            .field("personCapacity", Int?.self),
            .field("bathrooms", Double?.self),
            .field("listPhotoName", String?.self),
            .field("settingsData", [SettingsDatum?]?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("user", User?.self),
            .field("userAmenities", [UserAmenity?]?.self),
            .field("userSafetyAmenities", [UserSafetyAmenity?]?.self),
            .field("userSpaces", [UserSpace?]?.self),
            .field("houseRules", HouseRules?.self),
            .field("listingData", ListingData?.self),
            .field("blockedDates", [BlockedDate?]?.self),
            .field("reviewsCount", Int?.self),
            .field("reviewsStarRating", Int?.self),
            .field("isListOwner", Bool?.self),
            .field("wishListStatus", Bool?.self),
            .field("wishListGroupCount", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var title: String? { __data["title"] }
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
          var checkInBlockedDates: [CheckInBlockedDate?]? { __data["checkInBlockedDates"] }
          var fullBlockedDates: [FullBlockedDate?]? { __data["fullBlockedDates"] }
          var userBedsTypes: [UserBedsType?]? { __data["userBedsTypes"] }
          var residenceType: String? { __data["residenceType"] }
          var beds: Int? { __data["beds"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var bathrooms: Double? { __data["bathrooms"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var user: User? { __data["user"] }
          var userAmenities: [UserAmenity?]? { __data["userAmenities"] }
          var userSafetyAmenities: [UserSafetyAmenity?]? { __data["userSafetyAmenities"] }
          var userSpaces: [UserSpace?]? { __data["userSpaces"] }
          var houseRules: HouseRules? { __data["houseRules"] }
          var listingData: ListingData? { __data["listingData"] }
          var blockedDates: [BlockedDate?]? { __data["blockedDates"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var isListOwner: Bool? { __data["isListOwner"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var wishListGroupCount: Int? { __data["wishListGroupCount"] }

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
                .field("firstName", String?.self),
                .field("picture", String?.self),
              ] }

              var profileId: Int? { __data["profileId"] }
              var displayName: String? { __data["displayName"] }
              var firstName: String? { __data["firstName"] }
              var picture: String? { __data["picture"] }
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
              .field("itemName", String?.self),
              .field("image", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var itemName: String? { __data["itemName"] }
            var image: String? { __data["image"] }
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
              .field("itemName", String?.self),
              .field("image", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var itemName: String? { __data["itemName"] }
            var image: String? { __data["image"] }
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
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var itemName: String? { __data["itemName"] }
          }

          /// ViewListing.Results.HouseRules
          ///
          /// Parent Type: `HouseRules1`
          struct HouseRules: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.HouseRules1 }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("isAgeSelected", Bool?.self),
              .field("isEventSelected", Bool?.self),
              .field("isPetSelected", Bool?.self),
              .field("isChildrenSelected", Bool?.self),
              .field("isSmokingSelected", Bool?.self),
              .field("age", Age?.self),
              .field("event", Event?.self),
              .field("pet", Pet?.self),
              .field("children", Children?.self),
              .field("smoking", Smoking?.self),
              .field("dynamicRules", [DynamicRule?]?.self),
            ] }

            var isAgeSelected: Bool? { __data["isAgeSelected"] }
            var isEventSelected: Bool? { __data["isEventSelected"] }
            var isPetSelected: Bool? { __data["isPetSelected"] }
            var isChildrenSelected: Bool? { __data["isChildrenSelected"] }
            var isSmokingSelected: Bool? { __data["isSmokingSelected"] }
            var age: Age? { __data["age"] }
            var event: Event? { __data["event"] }
            var pet: Pet? { __data["pet"] }
            var children: Children? { __data["children"] }
            var smoking: Smoking? { __data["smoking"] }
            var dynamicRules: [DynamicRule?]? { __data["dynamicRules"] }

            /// ViewListing.Results.HouseRules.Age
            ///
            /// Parent Type: `Ageypes`
            struct Age: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Ageypes }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("age", Int?.self),
              ] }

              var age: Int? { __data["age"] }
            }

            /// ViewListing.Results.HouseRules.Event
            ///
            /// Parent Type: `Events`
            struct Event: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Events }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("isBirthDay", Bool?.self),
                .field("isFamilyGathering", Bool?.self),
                .field("isOtherSelcted", Bool?.self),
                .field("otherDetails", String?.self),
                .field("attendees", Int?.self),
              ] }

              var isBirthDay: Bool? { __data["isBirthDay"] }
              var isFamilyGathering: Bool? { __data["isFamilyGathering"] }
              var isOtherSelcted: Bool? { __data["isOtherSelcted"] }
              var otherDetails: String? { __data["otherDetails"] }
              var attendees: Int? { __data["attendees"] }
            }

            /// ViewListing.Results.HouseRules.Pet
            ///
            /// Parent Type: `Pets`
            struct Pet: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Pets }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("petNo", Int?.self),
                .field("isDogAllowed", Bool?.self),
                .field("isCatAllowed", Bool?.self),
                .field("anypet", Bool?.self),
                .field("petSize", String?.self),
              ] }

              var petNo: Int? { __data["petNo"] }
              var isDogAllowed: Bool? { __data["isDogAllowed"] }
              var isCatAllowed: Bool? { __data["isCatAllowed"] }
              var anypet: Bool? { __data["anypet"] }
              var petSize: String? { __data["petSize"] }
            }

            /// ViewListing.Results.HouseRules.Children
            ///
            /// Parent Type: `Childrens`
            struct Children: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Childrens }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("twoyears", Bool?.self),
                .field("twelveyears", Bool?.self),
                .field("seventeenyears", Bool?.self),
              ] }

              var twoyears: Bool? { __data["twoyears"] }
              var twelveyears: Bool? { __data["twelveyears"] }
              var seventeenyears: Bool? { __data["seventeenyears"] }
            }

            /// ViewListing.Results.HouseRules.Smoking
            ///
            /// Parent Type: `Smokings`
            struct Smoking: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Smokings }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("indoors", Bool?.self),
                .field("outDoors", Bool?.self),
                .field("details", String?.self),
              ] }

              var indoors: Bool? { __data["indoors"] }
              var outDoors: Bool? { __data["outDoors"] }
              var details: String? { __data["details"] }
            }

            /// ViewListing.Results.HouseRules.DynamicRule
            ///
            /// Parent Type: `DynamicRules`
            struct DynamicRule: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.DynamicRules }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("rule", String?.self),
                .field("id", Int?.self),
                .field("isSelected", Bool?.self),
                .field("isNoSelected", Bool?.self),
                .field("Details", String?.self),
              ] }

              var rule: String? { __data["rule"] }
              var id: Int? { __data["id"] }
              var isSelected: Bool? { __data["isSelected"] }
              var isNoSelected: Bool? { __data["isNoSelected"] }
              var details: String? { __data["Details"] }
            }
          }

          /// ViewListing.Results.ListingData
          ///
          /// Parent Type: `ListingDatas`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingDatas }
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
              .field("petFee", Int?.self),
              .field("petSelected", Bool?.self),
              .field("checkInEntrySelected", Bool?.self),
              .field("checkInType", String?.self),
              .field("texTypeId", Int?.self),
              .field("taxPercentage", Double?.self),
              .field("taxPersonAge", Int?.self),
              .field("taxAmount", Int?.self),
              .field("aboutHost", AboutHost?.self),
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
            var petFee: Int? { __data["petFee"] }
            var petSelected: Bool? { __data["petSelected"] }
            var checkInEntrySelected: Bool? { __data["checkInEntrySelected"] }
            var checkInType: String? { __data["checkInType"] }
            var texTypeId: Int? { __data["texTypeId"] }
            var taxPercentage: Double? { __data["taxPercentage"] }
            var taxPersonAge: Int? { __data["taxPersonAge"] }
            var taxAmount: Int? { __data["taxAmount"] }
            var aboutHost: AboutHost? { __data["aboutHost"] }

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

            /// ViewListing.Results.ListingData.AboutHost
            ///
            /// Parent Type: `AboutTypes`
            struct AboutHost: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.AboutTypes }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("isProfessional", Bool?.self),
                .field("bdStreet", String?.self),
                .field("bdApt", String?.self),
                .field("bdCity", String?.self),
                .field("bdState", String?.self),
                .field("bdzipcode", String?.self),
                .field("bdCountry", String?.self),
                .field("bmFirstname", String?.self),
                .field("bmLastname", String?.self),
                .field("businessName", String?.self),
              ] }

              var isProfessional: Bool? { __data["isProfessional"] }
              var bdStreet: String? { __data["bdStreet"] }
              var bdApt: String? { __data["bdApt"] }
              var bdCity: String? { __data["bdCity"] }
              var bdState: String? { __data["bdState"] }
              var bdzipcode: String? { __data["bdzipcode"] }
              var bdCountry: String? { __data["bdCountry"] }
              var bmFirstname: String? { __data["bmFirstname"] }
              var bmLastname: String? { __data["bmLastname"] }
              var businessName: String? { __data["businessName"] }
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
        }
      }
    }
  }

}