// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CancellationDataQuery: GraphQLQuery {
  public static let operationName: String = "CancellationData"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CancellationData($reservationId: Int!, $userType: String!, $currency: String) { cancelReservationData( reservationId: $reservationId userType: $userType currency: $currency ) { __typename results { __typename reservationId cancellationPolicy nonRefundableNightPrice refundToGuest payoutToHost guestServiceFee hostServiceFee startedIn stayingFor total listId guests threadId checkIn checkOut currency cancelledBy listTitle confirmationCode hostEmail guestName hostName guestProfilePicture hostProfilePicture isSpecialPriceAverage listData { __typename title id roomType beds reviewsCount reviewsStarRating bookingType listPhotos { __typename id name } listingData { __typename basePrice currency } } } status errorMessage } }"#
    ))

  public var reservationId: Int
  public var userType: String
  public var currency: GraphQLNullable<String>

  public init(
    reservationId: Int,
    userType: String,
    currency: GraphQLNullable<String>
  ) {
    self.reservationId = reservationId
    self.userType = userType
    self.currency = currency
  }

  public var __variables: Variables? { [
    "reservationId": reservationId,
    "userType": userType,
    "currency": currency
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cancelReservationData", CancelReservationData?.self, arguments: [
        "reservationId": .variable("reservationId"),
        "userType": .variable("userType"),
        "currency": .variable("currency")
      ]),
    ] }

    public var cancelReservationData: CancelReservationData? { __data["cancelReservationData"] }

    /// CancelReservationData
    ///
    /// Parent Type: `CancellationResponse`
    public struct CancelReservationData: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.CancellationResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// CancelReservationData.Results
      ///
      /// Parent Type: `ReservationCancel`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ReservationCancel }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("reservationId", Int?.self),
          .field("cancellationPolicy", String?.self),
          .field("nonRefundableNightPrice", Double?.self),
          .field("refundToGuest", Double?.self),
          .field("payoutToHost", Double?.self),
          .field("guestServiceFee", Double?.self),
          .field("hostServiceFee", Double?.self),
          .field("startedIn", Int?.self),
          .field("stayingFor", Double?.self),
          .field("total", Double?.self),
          .field("listId", Int?.self),
          .field("guests", Int?.self),
          .field("threadId", Int?.self),
          .field("checkIn", String?.self),
          .field("checkOut", String?.self),
          .field("currency", String?.self),
          .field("cancelledBy", String?.self),
          .field("listTitle", String?.self),
          .field("confirmationCode", Int?.self),
          .field("hostEmail", String?.self),
          .field("guestName", String?.self),
          .field("hostName", String?.self),
          .field("guestProfilePicture", String?.self),
          .field("hostProfilePicture", String?.self),
          .field("isSpecialPriceAverage", Double?.self),
          .field("listData", ListData?.self),
        ] }

        public var reservationId: Int? { __data["reservationId"] }
        public var cancellationPolicy: String? { __data["cancellationPolicy"] }
        public var nonRefundableNightPrice: Double? { __data["nonRefundableNightPrice"] }
        public var refundToGuest: Double? { __data["refundToGuest"] }
        public var payoutToHost: Double? { __data["payoutToHost"] }
        public var guestServiceFee: Double? { __data["guestServiceFee"] }
        public var hostServiceFee: Double? { __data["hostServiceFee"] }
        public var startedIn: Int? { __data["startedIn"] }
        public var stayingFor: Double? { __data["stayingFor"] }
        public var total: Double? { __data["total"] }
        public var listId: Int? { __data["listId"] }
        public var guests: Int? { __data["guests"] }
        public var threadId: Int? { __data["threadId"] }
        public var checkIn: String? { __data["checkIn"] }
        public var checkOut: String? { __data["checkOut"] }
        public var currency: String? { __data["currency"] }
        public var cancelledBy: String? { __data["cancelledBy"] }
        public var listTitle: String? { __data["listTitle"] }
        public var confirmationCode: Int? { __data["confirmationCode"] }
        public var hostEmail: String? { __data["hostEmail"] }
        public var guestName: String? { __data["guestName"] }
        public var hostName: String? { __data["hostName"] }
        public var guestProfilePicture: String? { __data["guestProfilePicture"] }
        public var hostProfilePicture: String? { __data["hostProfilePicture"] }
        public var isSpecialPriceAverage: Double? { __data["isSpecialPriceAverage"] }
        public var listData: ListData? { __data["listData"] }

        /// CancelReservationData.Results.ListData
        ///
        /// Parent Type: `ShowListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", String?.self),
            .field("id", Int?.self),
            .field("roomType", String?.self),
            .field("beds", Int?.self),
            .field("reviewsCount", Int?.self),
            .field("reviewsStarRating", Int?.self),
            .field("bookingType", String?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
          ] }

          public var title: String? { __data["title"] }
          public var id: Int? { __data["id"] }
          public var roomType: String? { __data["roomType"] }
          public var beds: Int? { __data["beds"] }
          public var reviewsCount: Int? { __data["reviewsCount"] }
          public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          public var bookingType: String? { __data["bookingType"] }
          public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          public var listingData: ListingData? { __data["listingData"] }

          /// CancelReservationData.Results.ListData.ListPhoto
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

          /// CancelReservationData.Results.ListData.ListingData
          ///
          /// Parent Type: `ListingData`
          public struct ListingData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingData }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("basePrice", Double?.self),
              .field("currency", String?.self),
            ] }

            public var basePrice: Double? { __data["basePrice"] }
            public var currency: String? { __data["currency"] }
          }
        }
      }
    }
  }
}
