// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ViewListingDetailsQuery: GraphQLQuery {
  public static let operationName: String = "viewListingDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("viewListing", ViewListing?.self, arguments: [
        "listId": .variable("listId"),
        "preview": .variable("preview")
      ]),
    ] }

    public var viewListing: ViewListing? { __data["viewListing"] }

    /// ViewListing
    ///
    /// Parent Type: `AllListing`
    public struct ViewListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllListing }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ViewListing.Results
      ///
      /// Parent Type: `ShowListing`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [ApolloAPI.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var userId: String? { __data["userId"] }
        public var title: String? { __data["title"] }
        public var residenceType: String? { __data["residenceType"] }
        public var description: String? { __data["description"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
        public var city: String? { __data["city"] }
        public var state: String? { __data["state"] }
        public var country: String? { __data["country"] }
        public var isPublished: Bool? { __data["isPublished"] }
        public var lat: Double? { __data["lat"] }
        public var lng: Double? { __data["lng"] }
        public var houseType: String? { __data["houseType"] }
        public var roomType: String? { __data["roomType"] }
        public var bookingType: String? { __data["bookingType"] }
        public var bedrooms: String? { __data["bedrooms"] }
        public var beds: Int? { __data["beds"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var bathrooms: Double? { __data["bathrooms"] }
        public var listPhotoName: String? { __data["listPhotoName"] }
        public var userBedsTypes: [UserBedsType?]? { __data["userBedsTypes"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingPhotos: [ListingPhoto?]? { __data["listingPhotos"] }
        public var user: User? { __data["user"] }
        public var userAmenities: [UserAmenity?]? { __data["userAmenities"] }
        public var userSafetyAmenities: [UserSafetyAmenity?]? { __data["userSafetyAmenities"] }
        public var userSpaces: [UserSpace?]? { __data["userSpaces"] }
        public var houseRules: [HouseRule?]? { __data["houseRules"] }
        public var settingsData: [SettingsDatum?]? { __data["settingsData"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var blockedDates: [BlockedDate?]? { __data["blockedDates"] }
        public var checkInBlockedDates: [CheckInBlockedDate?]? { __data["checkInBlockedDates"] }
        public var fullBlockedDates: [FullBlockedDate?]? { __data["fullBlockedDates"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
        public var isListOwner: Bool? { __data["isListOwner"] }
        public var wishListStatus: Bool? { __data["wishListStatus"] }
        public var wishListGroupCount: Int? { __data["wishListGroupCount"] }

        /// ViewListing.Results.UserBedsType
        ///
        /// Parent Type: `BedTypes`
        public struct UserBedsType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.BedTypes }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("bedCount", Int?.self),
            .field("bedName", String?.self),
          ] }

          public var bedCount: Int? { __data["bedCount"] }
          public var bedName: String? { __data["bedName"] }
        }

        /// ViewListing.Results.ListPhoto
        ///
        /// Parent Type: `ListPhotosData`
        public struct ListPhoto: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotosData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("name", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
        }

        /// ViewListing.Results.ListingPhoto
        ///
        /// Parent Type: `ListPhotosData`
        public struct ListingPhoto: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotosData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("name", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
        }

        /// ViewListing.Results.User
        ///
        /// Parent Type: `User`
        public struct User: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.User }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("email", String?.self),
            .field("profile", Profile?.self),
          ] }

          public var email: String? { __data["email"] }
          public var profile: Profile? { __data["profile"] }

          /// ViewListing.Results.User.Profile
          ///
          /// Parent Type: `Profile`
          public struct Profile: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Profile }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("picture", String?.self),
              .field("firstName", String?.self),
            ] }

            public var profileId: Int? { __data["profileId"] }
            public var displayName: String? { __data["displayName"] }
            public var picture: String? { __data["picture"] }
            public var firstName: String? { __data["firstName"] }
          }
        }

        /// ViewListing.Results.UserAmenity
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct UserAmenity: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("image", String?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// ViewListing.Results.UserSafetyAmenity
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct UserSafetyAmenity: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("image", String?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// ViewListing.Results.UserSpace
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct UserSpace: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("image", String?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// ViewListing.Results.HouseRule
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct HouseRule: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("image", String?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// ViewListing.Results.SettingsDatum
        ///
        /// Parent Type: `UserListingData`
        public struct SettingsDatum: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserListingData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("listsettings", Listsettings?.self),
          ] }

          public var listsettings: Listsettings? { __data["listsettings"] }

          /// ViewListing.Results.SettingsDatum.Listsettings
          ///
          /// Parent Type: `SingleListSettings`
          public struct Listsettings: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SingleListSettings }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("itemName", String?.self),
              .field("settingsType", SettingsType?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var itemName: String? { __data["itemName"] }
            public var settingsType: SettingsType? { __data["settingsType"] }

            /// ViewListing.Results.SettingsDatum.Listsettings.SettingsType
            ///
            /// Parent Type: `ListSettingsTypes`
            public struct SettingsType: PTProAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListSettingsTypes }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("typeName", String?.self),
              ] }

              public var typeName: String? { __data["typeName"] }
            }
          }
        }

        /// ViewListing.Results.ListingData
        ///
        /// Parent Type: `ListingData`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingData }
          public static var __selections: [ApolloAPI.Selection] { [
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

          public var bookingNoticeTime: String? { __data["bookingNoticeTime"] }
          public var checkInStart: String? { __data["checkInStart"] }
          public var checkInEnd: String? { __data["checkInEnd"] }
          public var maxDaysNotice: String? { __data["maxDaysNotice"] }
          public var minNight: Int? { __data["minNight"] }
          public var maxNight: Int? { __data["maxNight"] }
          public var basePrice: Double? { __data["basePrice"] }
          public var cleaningPrice: Double? { __data["cleaningPrice"] }
          public var currency: String? { __data["currency"] }
          public var weeklyDiscount: Int? { __data["weeklyDiscount"] }
          public var monthlyDiscount: Int? { __data["monthlyDiscount"] }
          public var cancellation: Cancellation? { __data["cancellation"] }

          /// ViewListing.Results.ListingData.Cancellation
          ///
          /// Parent Type: `Cancellation`
          public struct Cancellation: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Cancellation }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("policyName", String?.self),
              .field("policyContent", String?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var policyName: String? { __data["policyName"] }
            public var policyContent: String? { __data["policyContent"] }
          }
        }

        /// ViewListing.Results.BlockedDate
        ///
        /// Parent Type: `ListBlockedDates`
        public struct BlockedDate: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListBlockedDates }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("blockedDates", String?.self),
            .field("reservationId", Int?.self),
            .field("calendarStatus", String?.self),
            .field("isSpecialPrice", Double?.self),
            .field("listId", Int?.self),
            .field("dayStatus", String?.self),
          ] }

          public var blockedDates: String? { __data["blockedDates"] }
          public var reservationId: Int? { __data["reservationId"] }
          public var calendarStatus: String? { __data["calendarStatus"] }
          public var isSpecialPrice: Double? { __data["isSpecialPrice"] }
          public var listId: Int? { __data["listId"] }
          public var dayStatus: String? { __data["dayStatus"] }
        }

        /// ViewListing.Results.CheckInBlockedDate
        ///
        /// Parent Type: `ListBlockedDates`
        public struct CheckInBlockedDate: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListBlockedDates }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("listId", Int?.self),
            .field("blockedDates", String?.self),
            .field("calendarStatus", String?.self),
            .field("isSpecialPrice", Double?.self),
            .field("dayStatus", String?.self),
          ] }

          public var listId: Int? { __data["listId"] }
          public var blockedDates: String? { __data["blockedDates"] }
          public var calendarStatus: String? { __data["calendarStatus"] }
          public var isSpecialPrice: Double? { __data["isSpecialPrice"] }
          public var dayStatus: String? { __data["dayStatus"] }
        }

        /// ViewListing.Results.FullBlockedDate
        ///
        /// Parent Type: `ListBlockedDates`
        public struct FullBlockedDate: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListBlockedDates }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("listId", Int?.self),
            .field("blockedDates", String?.self),
            .field("calendarStatus", String?.self),
            .field("isSpecialPrice", Double?.self),
            .field("dayStatus", String?.self),
          ] }

          public var listId: Int? { __data["listId"] }
          public var blockedDates: String? { __data["blockedDates"] }
          public var calendarStatus: String? { __data["calendarStatus"] }
          public var isSpecialPrice: Double? { __data["isSpecialPrice"] }
          public var dayStatus: String? { __data["dayStatus"] }
        }
      }
    }
  }
}
