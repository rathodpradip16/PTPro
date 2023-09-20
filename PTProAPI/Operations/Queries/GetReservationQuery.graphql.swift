// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetReservationQuery: GraphQLQuery {
  public static let operationName: String = "getReservation"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getReservation($reservationId: Int!, $convertCurrency: String) { getReservation(reservationId: $reservationId, convertCurrency: $convertCurrency) { __typename status errorMessage results { __typename id nights listId hostId guestId checkIn checkOut guests message basePrice cleaningPrice currency discount checkInStart checkInEnd discountType isSpecialPriceAverage guestServiceFee hostServiceFee total totalWithGuestServiceFee confirmationCode paymentState payoutId paymentMethodId reservationState createdAt updatedAt listData { __typename id title beds street city state country zipcode reviewsCount reviewsStarRating roomType bookingType wishListStatus listPhotoName isListOwner listPhotos { __typename id name } listingData { __typename checkInStart checkInEnd } settingsData { __typename id listsettings { __typename id itemName } } } messageData { __typename id } hostData { __typename userId profileId displayName firstName phoneNumber picture } guestData { __typename userId profileId displayName firstName phoneNumber picture } hostUser { __typename email } guestUser { __typename email } } convertedBasePrice convertedHostServiceFee convertedGuestServicefee convertedIsSpecialAverage convertedTotalNightsAmount convertTotalWithGuestServiceFee convertedTotalWithHostServiceFee convertedCleaningPrice convertedDiscount } }"#
    ))

  public var reservationId: Int
  public var convertCurrency: GraphQLNullable<String>

  public init(
    reservationId: Int,
    convertCurrency: GraphQLNullable<String>
  ) {
    self.reservationId = reservationId
    self.convertCurrency = convertCurrency
  }

  public var __variables: Variables? { [
    "reservationId": reservationId,
    "convertCurrency": convertCurrency
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getReservation", GetReservation?.self, arguments: [
        "reservationId": .variable("reservationId"),
        "convertCurrency": .variable("convertCurrency")
      ]),
    ] }

    public var getReservation: GetReservation? { __data["getReservation"] }

    /// GetReservation
    ///
    /// Parent Type: `Reservationlist`
    public struct GetReservation: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservationlist }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", Results?.self),
        .field("convertedBasePrice", Double?.self),
        .field("convertedHostServiceFee", Double?.self),
        .field("convertedGuestServicefee", Double?.self),
        .field("convertedIsSpecialAverage", Double?.self),
        .field("convertedTotalNightsAmount", Double?.self),
        .field("convertTotalWithGuestServiceFee", Double?.self),
        .field("convertedTotalWithHostServiceFee", Double?.self),
        .field("convertedCleaningPrice", Double?.self),
        .field("convertedDiscount", Double?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: Results? { __data["results"] }
      public var convertedBasePrice: Double? { __data["convertedBasePrice"] }
      public var convertedHostServiceFee: Double? { __data["convertedHostServiceFee"] }
      public var convertedGuestServicefee: Double? { __data["convertedGuestServicefee"] }
      public var convertedIsSpecialAverage: Double? { __data["convertedIsSpecialAverage"] }
      public var convertedTotalNightsAmount: Double? { __data["convertedTotalNightsAmount"] }
      public var convertTotalWithGuestServiceFee: Double? { __data["convertTotalWithGuestServiceFee"] }
      public var convertedTotalWithHostServiceFee: Double? { __data["convertedTotalWithHostServiceFee"] }
      public var convertedCleaningPrice: Double? { __data["convertedCleaningPrice"] }
      public var convertedDiscount: Double? { __data["convertedDiscount"] }

      /// GetReservation.Results
      ///
      /// Parent Type: `Reservation`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("nights", Int?.self),
          .field("listId", Int?.self),
          .field("hostId", String?.self),
          .field("guestId", String?.self),
          .field("checkIn", String?.self),
          .field("checkOut", String?.self),
          .field("guests", Int?.self),
          .field("message", String?.self),
          .field("basePrice", Double?.self),
          .field("cleaningPrice", Double?.self),
          .field("currency", String?.self),
          .field("discount", Double?.self),
          .field("checkInStart", String?.self),
          .field("checkInEnd", String?.self),
          .field("discountType", String?.self),
          .field("isSpecialPriceAverage", Double?.self),
          .field("guestServiceFee", Double?.self),
          .field("hostServiceFee", Double?.self),
          .field("total", Double?.self),
          .field("totalWithGuestServiceFee", Double?.self),
          .field("confirmationCode", Int?.self),
          .field("paymentState", String?.self),
          .field("payoutId", Int?.self),
          .field("paymentMethodId", Int?.self),
          .field("reservationState", String?.self),
          .field("createdAt", String?.self),
          .field("updatedAt", String?.self),
          .field("listData", ListData?.self),
          .field("messageData", MessageData?.self),
          .field("hostData", HostData?.self),
          .field("guestData", GuestData?.self),
          .field("hostUser", HostUser?.self),
          .field("guestUser", GuestUser?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var nights: Int? { __data["nights"] }
        public var listId: Int? { __data["listId"] }
        public var hostId: String? { __data["hostId"] }
        public var guestId: String? { __data["guestId"] }
        public var checkIn: String? { __data["checkIn"] }
        public var checkOut: String? { __data["checkOut"] }
        public var guests: Int? { __data["guests"] }
        public var message: String? { __data["message"] }
        public var basePrice: Double? { __data["basePrice"] }
        public var cleaningPrice: Double? { __data["cleaningPrice"] }
        public var currency: String? { __data["currency"] }
        public var discount: Double? { __data["discount"] }
        public var checkInStart: String? { __data["checkInStart"] }
        public var checkInEnd: String? { __data["checkInEnd"] }
        public var discountType: String? { __data["discountType"] }
        public var isSpecialPriceAverage: Double? { __data["isSpecialPriceAverage"] }
        public var guestServiceFee: Double? { __data["guestServiceFee"] }
        public var hostServiceFee: Double? { __data["hostServiceFee"] }
        public var total: Double? { __data["total"] }
        public var totalWithGuestServiceFee: Double? { __data["totalWithGuestServiceFee"] }
        public var confirmationCode: Int? { __data["confirmationCode"] }
        public var paymentState: String? { __data["paymentState"] }
        public var payoutId: Int? { __data["payoutId"] }
        public var paymentMethodId: Int? { __data["paymentMethodId"] }
        public var reservationState: String? { __data["reservationState"] }
        public var createdAt: String? { __data["createdAt"] }
        public var updatedAt: String? { __data["updatedAt"] }
        public var listData: ListData? { __data["listData"] }
        public var messageData: MessageData? { __data["messageData"] }
        public var hostData: HostData? { __data["hostData"] }
        public var guestData: GuestData? { __data["guestData"] }
        public var hostUser: HostUser? { __data["hostUser"] }
        public var guestUser: GuestUser? { __data["guestUser"] }

        /// GetReservation.Results.ListData
        ///
        /// Parent Type: `ShowListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("beds", Int?.self),
            .field("street", String?.self),
            .field("city", String?.self),
            .field("state", String?.self),
            .field("country", String?.self),
            .field("zipcode", String?.self),
            .field("reviewsCount", Int?.self),
            .field("reviewsStarRating", Int?.self),
            .field("roomType", String?.self),
            .field("bookingType", String?.self),
            .field("wishListStatus", Bool?.self),
            .field("listPhotoName", String?.self),
            .field("isListOwner", Bool?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
            .field("settingsData", [SettingsDatum?]?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var title: String? { __data["title"] }
          public var beds: Int? { __data["beds"] }
          public var street: String? { __data["street"] }
          public var city: String? { __data["city"] }
          public var state: String? { __data["state"] }
          public var country: String? { __data["country"] }
          public var zipcode: String? { __data["zipcode"] }
          public var reviewsCount: Int? { __data["reviewsCount"] }
          public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          public var roomType: String? { __data["roomType"] }
          public var bookingType: String? { __data["bookingType"] }
          public var wishListStatus: Bool? { __data["wishListStatus"] }
          public var listPhotoName: String? { __data["listPhotoName"] }
          public var isListOwner: Bool? { __data["isListOwner"] }
          public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          public var listingData: ListingData? { __data["listingData"] }
          public var settingsData: [SettingsDatum?]? { __data["settingsData"] }

          /// GetReservation.Results.ListData.ListPhoto
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
            ] }

            public var id: Int? { __data["id"] }
            public var name: String? { __data["name"] }
          }

          /// GetReservation.Results.ListData.ListingData
          ///
          /// Parent Type: `ListingData`
          public struct ListingData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("checkInStart", String?.self),
              .field("checkInEnd", String?.self),
            ] }

            public var checkInStart: String? { __data["checkInStart"] }
            public var checkInEnd: String? { __data["checkInEnd"] }
          }

          /// GetReservation.Results.ListData.SettingsDatum
          ///
          /// Parent Type: `UserListingData`
          public struct SettingsDatum: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("listsettings", Listsettings?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var listsettings: Listsettings? { __data["listsettings"] }

            /// GetReservation.Results.ListData.SettingsDatum.Listsettings
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

        /// GetReservation.Results.MessageData
        ///
        /// Parent Type: `Threads`
        public struct MessageData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Threads }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
          ] }

          public var id: Int? { __data["id"] }
        }

        /// GetReservation.Results.HostData
        ///
        /// Parent Type: `UserProfile`
        public struct HostData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("firstName", String?.self),
            .field("phoneNumber", String?.self),
            .field("picture", String?.self),
          ] }

          public var userId: String? { __data["userId"] }
          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var firstName: String? { __data["firstName"] }
          public var phoneNumber: String? { __data["phoneNumber"] }
          public var picture: String? { __data["picture"] }
        }

        /// GetReservation.Results.GuestData
        ///
        /// Parent Type: `UserProfile`
        public struct GuestData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("firstName", String?.self),
            .field("phoneNumber", String?.self),
            .field("picture", String?.self),
          ] }

          public var userId: String? { __data["userId"] }
          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var firstName: String? { __data["firstName"] }
          public var phoneNumber: String? { __data["phoneNumber"] }
          public var picture: String? { __data["picture"] }
        }

        /// GetReservation.Results.HostUser
        ///
        /// Parent Type: `UserType`
        public struct HostUser: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("email", String?.self),
          ] }

          public var email: String? { __data["email"] }
        }

        /// GetReservation.Results.GuestUser
        ///
        /// Parent Type: `UserType`
        public struct GuestUser: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("email", String?.self),
          ] }

          public var email: String? { __data["email"] }
        }
      }
    }
  }
}
