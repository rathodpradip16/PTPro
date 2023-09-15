// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ConfirmPayPalExecuteMutation: GraphQLMutation {
  public static let operationName: String = "confirmPayPalExecute"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation confirmPayPalExecute($paymentId: String!, $payerId: String!) {
        confirmPayPalExecute(paymentId: $paymentId, payerId: $payerId) {
          __typename
          results {
            __typename
            id
            listId
            hostId
            guestId
            checkIn
            checkOut
            guests
            message
            basePrice
            cleaningPrice
            currency
            discount
            discountType
            guestServiceFee
            hostServiceFee
            total
            confirmationCode
            createdAt
            reservationState
            paymentState
          }
          status
          errorMessage
          reservationId
        }
      }
      """
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("confirmPayPalExecute", ConfirmPayPalExecute?.self, arguments: [
        "paymentId": .variable("paymentId"),
        "payerId": .variable("payerId")
      ]),
    ] }

    public var confirmPayPalExecute: ConfirmPayPalExecute? { __data["confirmPayPalExecute"] }

    /// ConfirmPayPalExecute
    ///
    /// Parent Type: `ReservationPayment`
    public struct ConfirmPayPalExecute: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ReservationPayment }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("reservationId", Int?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var reservationId: Int? { __data["reservationId"] }

      /// ConfirmPayPalExecute.Results
      ///
      /// Parent Type: `Reservation`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.Reservation }
        public static var __selections: [Selection] { [
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
