// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CancellationDataQuery: GraphQLQuery {
    static let operationName: String = "CancellationData"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("cancelReservationData", CancelReservationData?.self, arguments: [
          "reservationId": .variable("reservationId"),
          "userType": .variable("userType"),
          "currency": .variable("currency")
        ]),
      ] }

      var cancelReservationData: CancelReservationData? { __data["cancelReservationData"] }

      /// CancelReservationData
      ///
      /// Parent Type: `CancellationResponse`
      struct CancelReservationData: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CancellationResponse }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// CancelReservationData.Results
        ///
        /// Parent Type: `ReservationCancel`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReservationCancel }
          static var __selections: [Apollo.Selection] { [
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

          var reservationId: Int? { __data["reservationId"] }
          var cancellationPolicy: String? { __data["cancellationPolicy"] }
          var nonRefundableNightPrice: Double? { __data["nonRefundableNightPrice"] }
          var refundToGuest: Double? { __data["refundToGuest"] }
          var payoutToHost: Double? { __data["payoutToHost"] }
          var guestServiceFee: Double? { __data["guestServiceFee"] }
          var hostServiceFee: Double? { __data["hostServiceFee"] }
          var startedIn: Int? { __data["startedIn"] }
          var stayingFor: Double? { __data["stayingFor"] }
          var total: Double? { __data["total"] }
          var listId: Int? { __data["listId"] }
          var guests: Int? { __data["guests"] }
          var threadId: Int? { __data["threadId"] }
          var checkIn: String? { __data["checkIn"] }
          var checkOut: String? { __data["checkOut"] }
          var currency: String? { __data["currency"] }
          var cancelledBy: String? { __data["cancelledBy"] }
          var listTitle: String? { __data["listTitle"] }
          var confirmationCode: Int? { __data["confirmationCode"] }
          var hostEmail: String? { __data["hostEmail"] }
          var guestName: String? { __data["guestName"] }
          var hostName: String? { __data["hostName"] }
          var guestProfilePicture: String? { __data["guestProfilePicture"] }
          var hostProfilePicture: String? { __data["hostProfilePicture"] }
          var isSpecialPriceAverage: Double? { __data["isSpecialPriceAverage"] }
          var listData: ListData? { __data["listData"] }

          /// CancelReservationData.Results.ListData
          ///
          /// Parent Type: `ShowListing`
          struct ListData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
            static var __selections: [Apollo.Selection] { [
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

            var title: String? { __data["title"] }
            var id: Int? { __data["id"] }
            var roomType: String? { __data["roomType"] }
            var beds: Int? { __data["beds"] }
            var reviewsCount: Int? { __data["reviewsCount"] }
            var reviewsStarRating: Int? { __data["reviewsStarRating"] }
            var bookingType: String? { __data["bookingType"] }
            var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
            var listingData: ListingData? { __data["listingData"] }

            /// CancelReservationData.Results.ListData.ListPhoto
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

            /// CancelReservationData.Results.ListData.ListingData
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
              ] }

              var basePrice: Double? { __data["basePrice"] }
              var currency: String? { __data["currency"] }
            }
          }
        }
      }
    }
  }

}