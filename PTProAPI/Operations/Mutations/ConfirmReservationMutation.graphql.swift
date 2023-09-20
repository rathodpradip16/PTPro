// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ConfirmReservationMutation: GraphQLMutation {
    static let operationName: String = "confirmReservation"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation confirmReservation($reservationId: Int!, $paymentIntentId: String!) { confirmReservation( reservationId: $reservationId paymentIntentId: $paymentIntentId ) { __typename results { __typename id listId hostId guestId checkIn checkOut guests message basePrice cleaningPrice currency discount discountType guestServiceFee hostServiceFee total confirmationCode createdAt reservationState paymentState } status errorMessage requireAdditionalAction paymentIntentSecret reservationId } }"#
      ))

    public var reservationId: Int
    public var paymentIntentId: String

    public init(
      reservationId: Int,
      paymentIntentId: String
    ) {
      self.reservationId = reservationId
      self.paymentIntentId = paymentIntentId
    }

    public var __variables: Variables? { [
      "reservationId": reservationId,
      "paymentIntentId": paymentIntentId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("confirmReservation", ConfirmReservation?.self, arguments: [
          "reservationId": .variable("reservationId"),
          "paymentIntentId": .variable("paymentIntentId")
        ]),
      ] }

      var confirmReservation: ConfirmReservation? { __data["confirmReservation"] }

      /// ConfirmReservation
      ///
      /// Parent Type: `ReservationPayment`
      struct ConfirmReservation: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReservationPayment }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("requireAdditionalAction", Bool?.self),
          .field("paymentIntentSecret", String?.self),
          .field("reservationId", Int?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var requireAdditionalAction: Bool? { __data["requireAdditionalAction"] }
        var paymentIntentSecret: String? { __data["paymentIntentSecret"] }
        var reservationId: Int? { __data["reservationId"] }

        /// ConfirmReservation.Results
        ///
        /// Parent Type: `Reservation`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
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
            .field("discountType", String?.self),
            .field("guestServiceFee", Double?.self),
            .field("hostServiceFee", Double?.self),
            .field("total", Double?.self),
            .field("confirmationCode", Int?.self),
            .field("createdAt", String?.self),
            .field("reservationState", String?.self),
            .field("paymentState", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var hostId: String? { __data["hostId"] }
          var guestId: String? { __data["guestId"] }
          var checkIn: String? { __data["checkIn"] }
          var checkOut: String? { __data["checkOut"] }
          var guests: Int? { __data["guests"] }
          var message: String? { __data["message"] }
          var basePrice: Double? { __data["basePrice"] }
          var cleaningPrice: Double? { __data["cleaningPrice"] }
          var currency: String? { __data["currency"] }
          var discount: Double? { __data["discount"] }
          var discountType: String? { __data["discountType"] }
          var guestServiceFee: Double? { __data["guestServiceFee"] }
          var hostServiceFee: Double? { __data["hostServiceFee"] }
          var total: Double? { __data["total"] }
          var confirmationCode: Int? { __data["confirmationCode"] }
          var createdAt: String? { __data["createdAt"] }
          var reservationState: String? { __data["reservationState"] }
          var paymentState: String? { __data["paymentState"] }
        }
      }
    }
  }

}