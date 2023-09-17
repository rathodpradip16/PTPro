// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllReservationQuery: GraphQLQuery {
  public static let operationName: String = "getAllReservation"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getAllReservation($userType: String, $currentPage: Int, $dateFilter: String) { getAllReservation( userType: $userType currentPage: $currentPage dateFilter: $dateFilter ) { __typename result { __typename id listId hostId guestId checkIn checkOut nights guests guestServiceFee hostServiceFee reservationState total currency cancellationPolicy messageData { __typename id } listData { __typename id title street city state country zipcode reviewsCount reviewsStarRating roomType bookingType wishListStatus listPhotoName listPhotos { __typename id name } listingData { __typename currency basePrice checkInStart checkInEnd } settingsData { __typename id listsettings { __typename id itemName } } } hostData { __typename profileId displayName picture firstName phoneNumber fullPhoneNumber userId userData { __typename email } } guestData { __typename profileId displayName picture phoneNumber fullPhoneNumber firstName userId userData { __typename email } } hostUser { __typename email } guestUser { __typename email } } count status errorMessage } }"#
    ))

  public var userType: GraphQLNullable<String>
  public var currentPage: GraphQLNullable<Int>
  public var dateFilter: GraphQLNullable<String>

  public init(
    userType: GraphQLNullable<String>,
    currentPage: GraphQLNullable<Int>,
    dateFilter: GraphQLNullable<String>
  ) {
    self.userType = userType
    self.currentPage = currentPage
    self.dateFilter = dateFilter
  }

  public var __variables: Variables? { [
    "userType": userType,
    "currentPage": currentPage,
    "dateFilter": dateFilter
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getAllReservation", GetAllReservation?.self, arguments: [
        "userType": .variable("userType"),
        "currentPage": .variable("currentPage"),
        "dateFilter": .variable("dateFilter")
      ]),
    ] }

    public var getAllReservation: GetAllReservation? { __data["getAllReservation"] }

    /// GetAllReservation
    ///
    /// Parent Type: `AllReservation`
    public struct GetAllReservation: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllReservation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("result", [Result?]?.self),
        .field("count", Int?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: [Result?]? { __data["result"] }
      public var count: Int? { __data["count"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetAllReservation.Result
      ///
      /// Parent Type: `Reservation`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Reservation }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("listId", Int?.self),
          .field("hostId", String?.self),
          .field("guestId", String?.self),
          .field("checkIn", String?.self),
          .field("checkOut", String?.self),
          .field("nights", Int?.self),
          .field("guests", Int?.self),
          .field("guestServiceFee", Double?.self),
          .field("hostServiceFee", Double?.self),
          .field("reservationState", String?.self),
          .field("total", Double?.self),
          .field("currency", String?.self),
          .field("cancellationPolicy", Int?.self),
          .field("messageData", MessageData?.self),
          .field("listData", ListData?.self),
          .field("hostData", HostData?.self),
          .field("guestData", GuestData?.self),
          .field("hostUser", HostUser?.self),
          .field("guestUser", GuestUser?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var hostId: String? { __data["hostId"] }
        public var guestId: String? { __data["guestId"] }
        public var checkIn: String? { __data["checkIn"] }
        public var checkOut: String? { __data["checkOut"] }
        public var nights: Int? { __data["nights"] }
        public var guests: Int? { __data["guests"] }
        public var guestServiceFee: Double? { __data["guestServiceFee"] }
        public var hostServiceFee: Double? { __data["hostServiceFee"] }
        public var reservationState: String? { __data["reservationState"] }
        public var total: Double? { __data["total"] }
        public var currency: String? { __data["currency"] }
        public var cancellationPolicy: Int? { __data["cancellationPolicy"] }
        public var messageData: MessageData? { __data["messageData"] }
        public var listData: ListData? { __data["listData"] }
        public var hostData: HostData? { __data["hostData"] }
        public var guestData: GuestData? { __data["guestData"] }
        public var hostUser: HostUser? { __data["hostUser"] }
        public var guestUser: GuestUser? { __data["guestUser"] }

        /// GetAllReservation.Result.MessageData
        ///
        /// Parent Type: `Threads`
        public struct MessageData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Threads }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
          ] }

          public var id: Int? { __data["id"] }
        }

        /// GetAllReservation.Result.ListData
        ///
        /// Parent Type: `ShowListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
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
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
            .field("settingsData", [SettingsDatum?]?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var title: String? { __data["title"] }
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
          public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          public var listingData: ListingData? { __data["listingData"] }
          public var settingsData: [SettingsDatum?]? { __data["settingsData"] }

          /// GetAllReservation.Result.ListData.ListPhoto
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

          /// GetAllReservation.Result.ListData.ListingData
          ///
          /// Parent Type: `ListingData`
          public struct ListingData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingData }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("currency", String?.self),
              .field("basePrice", Double?.self),
              .field("checkInStart", String?.self),
              .field("checkInEnd", String?.self),
            ] }

            public var currency: String? { __data["currency"] }
            public var basePrice: Double? { __data["basePrice"] }
            public var checkInStart: String? { __data["checkInStart"] }
            public var checkInEnd: String? { __data["checkInEnd"] }
          }

          /// GetAllReservation.Result.ListData.SettingsDatum
          ///
          /// Parent Type: `UserListingData`
          public struct SettingsDatum: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserListingData }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("listsettings", Listsettings?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var listsettings: Listsettings? { __data["listsettings"] }

            /// GetAllReservation.Result.ListData.SettingsDatum.Listsettings
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
              ] }

              public var id: Int? { __data["id"] }
              public var itemName: String? { __data["itemName"] }
            }
          }
        }

        /// GetAllReservation.Result.HostData
        ///
        /// Parent Type: `UserProfile`
        public struct HostData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("picture", String?.self),
            .field("firstName", String?.self),
            .field("phoneNumber", String?.self),
            .field("fullPhoneNumber", String?.self),
            .field("userId", String?.self),
            .field("userData", UserData?.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var picture: String? { __data["picture"] }
          public var firstName: String? { __data["firstName"] }
          public var phoneNumber: String? { __data["phoneNumber"] }
          public var fullPhoneNumber: String? { __data["fullPhoneNumber"] }
          public var userId: String? { __data["userId"] }
          public var userData: UserData? { __data["userData"] }

          /// GetAllReservation.Result.HostData.UserData
          ///
          /// Parent Type: `UserType`
          public struct UserData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserType }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("email", String?.self),
            ] }

            public var email: String? { __data["email"] }
          }
        }

        /// GetAllReservation.Result.GuestData
        ///
        /// Parent Type: `UserProfile`
        public struct GuestData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("picture", String?.self),
            .field("phoneNumber", String?.self),
            .field("fullPhoneNumber", String?.self),
            .field("firstName", String?.self),
            .field("userId", String?.self),
            .field("userData", UserData?.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var picture: String? { __data["picture"] }
          public var phoneNumber: String? { __data["phoneNumber"] }
          public var fullPhoneNumber: String? { __data["fullPhoneNumber"] }
          public var firstName: String? { __data["firstName"] }
          public var userId: String? { __data["userId"] }
          public var userData: UserData? { __data["userData"] }

          /// GetAllReservation.Result.GuestData.UserData
          ///
          /// Parent Type: `UserType`
          public struct UserData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserType }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("email", String?.self),
            ] }

            public var email: String? { __data["email"] }
          }
        }

        /// GetAllReservation.Result.HostUser
        ///
        /// Parent Type: `UserType`
        public struct HostUser: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserType }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("email", String?.self),
          ] }

          public var email: String? { __data["email"] }
        }

        /// GetAllReservation.Result.GuestUser
        ///
        /// Parent Type: `UserType`
        public struct GuestUser: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserType }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("email", String?.self),
          ] }

          public var email: String? { __data["email"] }
        }
      }
    }
  }
}
