// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ConfirmPayPalExecuteMutation: GraphQLMutation {
    static let operationName: String = "confirmPayPalExecute"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation confirmPayPalExecute($paymentId: String!, $payerId: String!) { confirmPayPalExecute(paymentId: $paymentId, payerId: $payerId) { __typename results { __typename id listId hostId guestId checkIn checkOut guests message basePrice cleaningPrice currency discount discountType guestServiceFee hostServiceFee total confirmationCode createdAt reservationState paymentState } status errorMessage reservationId } }"#
      ))

    public var paymentId: String
    public var payerId: String

    public init(
      paymentId: String,
      payerId: String
    ) {
      self.paymentId = paymentId
      self.payerId = payerId
    }

    public var __variables: Variables? { [
      "paymentId": paymentId,
      "payerId": payerId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("confirmPayPalExecute", ConfirmPayPalExecute?.self, arguments: [
          "paymentId": .variable("paymentId"),
          "payerId": .variable("payerId")
        ]),
      ] }

      var confirmPayPalExecute: ConfirmPayPalExecute? { __data["confirmPayPalExecute"] }

      /// ConfirmPayPalExecute
      ///
      /// Parent Type: `ReservationPayment`
      struct ConfirmPayPalExecute: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReservationPayment }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("reservationId", Int?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var reservationId: Int? { __data["reservationId"] }

        /// ConfirmPayPalExecute.Results
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