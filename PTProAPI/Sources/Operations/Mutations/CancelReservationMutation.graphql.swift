// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CancelReservationMutation: GraphQLMutation {
  public static let operationName: String = "CancelReservation"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation CancelReservation($reservationId: Int!, $cancellationPolicy: String!, $refundToGuest: Float!, $payoutToHost: Float!, $guestServiceFee: Float!, $hostServiceFee: Float!, $total: Float!, $currency: String!, $threadId: Int!, $cancelledBy: String!, $message: String!, $checkIn: String!, $checkOut: String!, $guests: Int!) {
        cancelReservation(
          reservationId: $reservationId
          cancellationPolicy: $cancellationPolicy
          refundToGuest: $refundToGuest
          payoutToHost: $payoutToHost
          guestServiceFee: $guestServiceFee
          hostServiceFee: $hostServiceFee
          total: $total
          currency: $currency
          threadId: $threadId
          cancelledBy: $cancelledBy
          message: $message
          checkIn: $checkIn
          checkOut: $checkOut
          guests: $guests
        ) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var reservationId: Int
  public var cancellationPolicy: String
  public var refundToGuest: Double
  public var payoutToHost: Double
  public var guestServiceFee: Double
  public var hostServiceFee: Double
  public var total: Double
  public var currency: String
  public var threadId: Int
  public var cancelledBy: String
  public var message: String
  public var checkIn: String
  public var checkOut: String
  public var guests: Int

  public init(
    reservationId: Int,
    cancellationPolicy: String,
    refundToGuest: Double,
    payoutToHost: Double,
    guestServiceFee: Double,
    hostServiceFee: Double,
    total: Double,
    currency: String,
    threadId: Int,
    cancelledBy: String,
    message: String,
    checkIn: String,
    checkOut: String,
    guests: Int
  ) {
    self.reservationId = reservationId
    self.cancellationPolicy = cancellationPolicy
    self.refundToGuest = refundToGuest
    self.payoutToHost = payoutToHost
    self.guestServiceFee = guestServiceFee
    self.hostServiceFee = hostServiceFee
    self.total = total
    self.currency = currency
    self.threadId = threadId
    self.cancelledBy = cancelledBy
    self.message = message
    self.checkIn = checkIn
    self.checkOut = checkOut
    self.guests = guests
  }

  public var __variables: Variables? { [
    "reservationId": reservationId,
    "cancellationPolicy": cancellationPolicy,
    "refundToGuest": refundToGuest,
    "payoutToHost": payoutToHost,
    "guestServiceFee": guestServiceFee,
    "hostServiceFee": hostServiceFee,
    "total": total,
    "currency": currency,
    "threadId": threadId,
    "cancelledBy": cancelledBy,
    "message": message,
    "checkIn": checkIn,
    "checkOut": checkOut,
    "guests": guests
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("cancelReservation", CancelReservation?.self, arguments: [
        "reservationId": .variable("reservationId"),
        "cancellationPolicy": .variable("cancellationPolicy"),
        "refundToGuest": .variable("refundToGuest"),
        "payoutToHost": .variable("payoutToHost"),
        "guestServiceFee": .variable("guestServiceFee"),
        "hostServiceFee": .variable("hostServiceFee"),
        "total": .variable("total"),
        "currency": .variable("currency"),
        "threadId": .variable("threadId"),
        "cancelledBy": .variable("cancelledBy"),
        "message": .variable("message"),
        "checkIn": .variable("checkIn"),
        "checkOut": .variable("checkOut"),
        "guests": .variable("guests")
      ]),
    ] }

    public var cancelReservation: CancelReservation? { __data["cancelReservation"] }

    /// CancelReservation
    ///
    /// Parent Type: `Reservationlist`
    public struct CancelReservation: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.Reservationlist }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
