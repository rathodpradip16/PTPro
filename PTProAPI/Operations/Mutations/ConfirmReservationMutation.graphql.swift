// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ConfirmReservationMutation: GraphQLMutation {
  public static let operationName: String = "confirmReservation"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("confirmReservation", ConfirmReservation?.self, arguments: [
        "reservationId": .variable("reservationId"),
        "paymentIntentId": .variable("paymentIntentId")
      ]),
    ] }

    public var confirmReservation: ConfirmReservation? { __data["confirmReservation"] }

    /// ConfirmReservation
    ///
    /// Parent Type: `ReservationPayment`
    public struct ConfirmReservation: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReservationPayment }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("requireAdditionalAction", Bool?.self),
        .field("paymentIntentSecret", String?.self),
        .field("reservationId", Int?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var requireAdditionalAction: Bool? { __data["requireAdditionalAction"] }
      public var paymentIntentSecret: String? { __data["paymentIntentSecret"] }
      public var reservationId: Int? { __data["reservationId"] }

      /// ConfirmReservation.Results
      ///
      /// Parent Type: `Reservation`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
        public static var __selections: [Apollo.Selection] { [
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

        public var id: Int? { __data["id"] }
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
        public var discountType: String? { __data["discountType"] }
        public var guestServiceFee: Double? { __data["guestServiceFee"] }
        public var hostServiceFee: Double? { __data["hostServiceFee"] }
        public var total: Double? { __data["total"] }
        public var confirmationCode: Int? { __data["confirmationCode"] }
        public var createdAt: String? { __data["createdAt"] }
        public var reservationState: String? { __data["reservationState"] }
        public var paymentState: String? { __data["paymentState"] }
      }
    }
  }
}
