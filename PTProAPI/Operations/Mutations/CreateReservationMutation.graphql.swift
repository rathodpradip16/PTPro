// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class CreateReservationMutation: GraphQLMutation {
  public static let operationName: String = "createReservation"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation createReservation($listId: Int!, $checkIn: String!, $checkOut: String!, $guests: Int!, $message: String!, $basePrice: Float!, $cleaningPrice: Float!, $currency: String!, $discount: Float, $discountType: String, $guestServiceFee: Float, $hostServiceFee: Float, $total: Float!, $bookingType: String, $cardToken: String!, $paymentType: Int, $convCurrency: String!, $averagePrice: Float, $nights: Int, $paymentCurrency: String) { createReservation( listId: $listId checkIn: $checkIn checkOut: $checkOut guests: $guests message: $message basePrice: $basePrice cleaningPrice: $cleaningPrice currency: $currency discount: $discount discountType: $discountType guestServiceFee: $guestServiceFee hostServiceFee: $hostServiceFee total: $total bookingType: $bookingType cardToken: $cardToken paymentType: $paymentType convCurrency: $convCurrency averagePrice: $averagePrice nights: $nights paymentCurrency: $paymentCurrency ) { __typename results { __typename id listId hostId guestId checkIn checkOut guests message basePrice cleaningPrice currency discount discountType guestServiceFee hostServiceFee total confirmationCode createdAt reservationState paymentState } status errorMessage requireAdditionalAction paymentIntentSecret reservationId redirectUrl } }"#
    ))

  public var listId: Int
  public var checkIn: String
  public var checkOut: String
  public var guests: Int
  public var message: String
  public var basePrice: Double
  public var cleaningPrice: Double
  public var currency: String
  public var discount: GraphQLNullable<Double>
  public var discountType: GraphQLNullable<String>
  public var guestServiceFee: GraphQLNullable<Double>
  public var hostServiceFee: GraphQLNullable<Double>
  public var total: Double
  public var bookingType: GraphQLNullable<String>
  public var cardToken: String
  public var paymentType: GraphQLNullable<Int>
  public var convCurrency: String
  public var averagePrice: GraphQLNullable<Double>
  public var nights: GraphQLNullable<Int>
  public var paymentCurrency: GraphQLNullable<String>

  public init(
    listId: Int,
    checkIn: String,
    checkOut: String,
    guests: Int,
    message: String,
    basePrice: Double,
    cleaningPrice: Double,
    currency: String,
    discount: GraphQLNullable<Double>,
    discountType: GraphQLNullable<String>,
    guestServiceFee: GraphQLNullable<Double>,
    hostServiceFee: GraphQLNullable<Double>,
    total: Double,
    bookingType: GraphQLNullable<String>,
    cardToken: String,
    paymentType: GraphQLNullable<Int>,
    convCurrency: String,
    averagePrice: GraphQLNullable<Double>,
    nights: GraphQLNullable<Int>,
    paymentCurrency: GraphQLNullable<String>
  ) {
    self.listId = listId
    self.checkIn = checkIn
    self.checkOut = checkOut
    self.guests = guests
    self.message = message
    self.basePrice = basePrice
    self.cleaningPrice = cleaningPrice
    self.currency = currency
    self.discount = discount
    self.discountType = discountType
    self.guestServiceFee = guestServiceFee
    self.hostServiceFee = hostServiceFee
    self.total = total
    self.bookingType = bookingType
    self.cardToken = cardToken
    self.paymentType = paymentType
    self.convCurrency = convCurrency
    self.averagePrice = averagePrice
    self.nights = nights
    self.paymentCurrency = paymentCurrency
  }

  public var __variables: Variables? { [
    "listId": listId,
    "checkIn": checkIn,
    "checkOut": checkOut,
    "guests": guests,
    "message": message,
    "basePrice": basePrice,
    "cleaningPrice": cleaningPrice,
    "currency": currency,
    "discount": discount,
    "discountType": discountType,
    "guestServiceFee": guestServiceFee,
    "hostServiceFee": hostServiceFee,
    "total": total,
    "bookingType": bookingType,
    "cardToken": cardToken,
    "paymentType": paymentType,
    "convCurrency": convCurrency,
    "averagePrice": averagePrice,
    "nights": nights,
    "paymentCurrency": paymentCurrency
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("createReservation", CreateReservation?.self, arguments: [
        "listId": .variable("listId"),
        "checkIn": .variable("checkIn"),
        "checkOut": .variable("checkOut"),
        "guests": .variable("guests"),
        "message": .variable("message"),
        "basePrice": .variable("basePrice"),
        "cleaningPrice": .variable("cleaningPrice"),
        "currency": .variable("currency"),
        "discount": .variable("discount"),
        "discountType": .variable("discountType"),
        "guestServiceFee": .variable("guestServiceFee"),
        "hostServiceFee": .variable("hostServiceFee"),
        "total": .variable("total"),
        "bookingType": .variable("bookingType"),
        "cardToken": .variable("cardToken"),
        "paymentType": .variable("paymentType"),
        "convCurrency": .variable("convCurrency"),
        "averagePrice": .variable("averagePrice"),
        "nights": .variable("nights"),
        "paymentCurrency": .variable("paymentCurrency")
      ]),
    ] }

    public var createReservation: CreateReservation? { __data["createReservation"] }

    /// CreateReservation
    ///
    /// Parent Type: `ReservationPayment`
    public struct CreateReservation: PTProAPI.SelectionSet {
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
        .field("redirectUrl", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var requireAdditionalAction: Bool? { __data["requireAdditionalAction"] }
      public var paymentIntentSecret: String? { __data["paymentIntentSecret"] }
      public var reservationId: Int? { __data["reservationId"] }
      public var redirectUrl: String? { __data["redirectUrl"] }

      /// CreateReservation.Results
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
