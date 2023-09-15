// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateListingStep3Mutation: GraphQLMutation {
  public static let operationName: String = "UpdateListingStep3"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation UpdateListingStep3($id: Int, $houseRules: [Int], $bookingNoticeTime: String, $checkInStart: String, $checkInEnd: String, $maxDaysNotice: String, $minNight: Int, $maxNight: Int, $basePrice: Float, $cleaningPrice: Float, $currency: String, $weeklyDiscount: Int, $monthlyDiscount: Int, $blockedDates: [String], $bookingType: String!, $cancellationPolicy: Int) {
        updateListingStep3(
          id: $id
          houseRules: $houseRules
          bookingNoticeTime: $bookingNoticeTime
          checkInStart: $checkInStart
          checkInEnd: $checkInEnd
          maxDaysNotice: $maxDaysNotice
          minNight: $minNight
          maxNight: $maxNight
          basePrice: $basePrice
          cleaningPrice: $cleaningPrice
          currency: $currency
          weeklyDiscount: $weeklyDiscount
          monthlyDiscount: $monthlyDiscount
          blockedDates: $blockedDates
          bookingType: $bookingType
          cancellationPolicy: $cancellationPolicy
        ) {
          __typename
          results {
            __typename
            id
            houseRules
            bookingNoticeTime
            checkInStart
            checkInEnd
            maxDaysNotice
            minNight
            maxNight
            basePrice
            cleaningPrice
            currency
            weeklyDiscount
            monthlyDiscount
            blockedDates
          }
          status
          errorMessage
          actionType
        }
      }
      """
    ))

  public var id: GraphQLNullable<Int>
  public var houseRules: GraphQLNullable<[Int?]>
  public var bookingNoticeTime: GraphQLNullable<String>
  public var checkInStart: GraphQLNullable<String>
  public var checkInEnd: GraphQLNullable<String>
  public var maxDaysNotice: GraphQLNullable<String>
  public var minNight: GraphQLNullable<Int>
  public var maxNight: GraphQLNullable<Int>
  public var basePrice: GraphQLNullable<Double>
  public var cleaningPrice: GraphQLNullable<Double>
  public var currency: GraphQLNullable<String>
  public var weeklyDiscount: GraphQLNullable<Int>
  public var monthlyDiscount: GraphQLNullable<Int>
  public var blockedDates: GraphQLNullable<[String?]>
  public var bookingType: String
  public var cancellationPolicy: GraphQLNullable<Int>

  public init(
    id: GraphQLNullable<Int>,
    houseRules: GraphQLNullable<[Int?]>,
    bookingNoticeTime: GraphQLNullable<String>,
    checkInStart: GraphQLNullable<String>,
    checkInEnd: GraphQLNullable<String>,
    maxDaysNotice: GraphQLNullable<String>,
    minNight: GraphQLNullable<Int>,
    maxNight: GraphQLNullable<Int>,
    basePrice: GraphQLNullable<Double>,
    cleaningPrice: GraphQLNullable<Double>,
    currency: GraphQLNullable<String>,
    weeklyDiscount: GraphQLNullable<Int>,
    monthlyDiscount: GraphQLNullable<Int>,
    blockedDates: GraphQLNullable<[String?]>,
    bookingType: String,
    cancellationPolicy: GraphQLNullable<Int>
  ) {
    self.id = id
    self.houseRules = houseRules
    self.bookingNoticeTime = bookingNoticeTime
    self.checkInStart = checkInStart
    self.checkInEnd = checkInEnd
    self.maxDaysNotice = maxDaysNotice
    self.minNight = minNight
    self.maxNight = maxNight
    self.basePrice = basePrice
    self.cleaningPrice = cleaningPrice
    self.currency = currency
    self.weeklyDiscount = weeklyDiscount
    self.monthlyDiscount = monthlyDiscount
    self.blockedDates = blockedDates
    self.bookingType = bookingType
    self.cancellationPolicy = cancellationPolicy
  }

  public var __variables: Variables? { [
    "id": id,
    "houseRules": houseRules,
    "bookingNoticeTime": bookingNoticeTime,
    "checkInStart": checkInStart,
    "checkInEnd": checkInEnd,
    "maxDaysNotice": maxDaysNotice,
    "minNight": minNight,
    "maxNight": maxNight,
    "basePrice": basePrice,
    "cleaningPrice": cleaningPrice,
    "currency": currency,
    "weeklyDiscount": weeklyDiscount,
    "monthlyDiscount": monthlyDiscount,
    "blockedDates": blockedDates,
    "bookingType": bookingType,
    "cancellationPolicy": cancellationPolicy
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("updateListingStep3", UpdateListingStep3?.self, arguments: [
        "id": .variable("id"),
        "houseRules": .variable("houseRules"),
        "bookingNoticeTime": .variable("bookingNoticeTime"),
        "checkInStart": .variable("checkInStart"),
        "checkInEnd": .variable("checkInEnd"),
        "maxDaysNotice": .variable("maxDaysNotice"),
        "minNight": .variable("minNight"),
        "maxNight": .variable("maxNight"),
        "basePrice": .variable("basePrice"),
        "cleaningPrice": .variable("cleaningPrice"),
        "currency": .variable("currency"),
        "weeklyDiscount": .variable("weeklyDiscount"),
        "monthlyDiscount": .variable("monthlyDiscount"),
        "blockedDates": .variable("blockedDates"),
        "bookingType": .variable("bookingType"),
        "cancellationPolicy": .variable("cancellationPolicy")
      ]),
    ] }

    public var updateListingStep3: UpdateListingStep3? { __data["updateListingStep3"] }

    /// UpdateListingStep3
    ///
    /// Parent Type: `EditListingResponse`
    public struct UpdateListingStep3: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.EditListingResponse }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("actionType", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var actionType: String? { __data["actionType"] }

      /// UpdateListingStep3.Results
      ///
      /// Parent Type: `EditListing`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.EditListing }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("houseRules", [Int?]?.self),
          .field("bookingNoticeTime", String?.self),
          .field("checkInStart", String?.self),
          .field("checkInEnd", String?.self),
          .field("maxDaysNotice", String?.self),
          .field("minNight", Int?.self),
          .field("maxNight", Int?.self),
          .field("basePrice", Double?.self),
          .field("cleaningPrice", Double?.self),
          .field("currency", String?.self),
          .field("weeklyDiscount", Int?.self),
          .field("monthlyDiscount", Int?.self),
          .field("blockedDates", [String?]?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var houseRules: [Int?]? { __data["houseRules"] }
        public var bookingNoticeTime: String? { __data["bookingNoticeTime"] }
        public var checkInStart: String? { __data["checkInStart"] }
        public var checkInEnd: String? { __data["checkInEnd"] }
        public var maxDaysNotice: String? { __data["maxDaysNotice"] }
        public var minNight: Int? { __data["minNight"] }
        public var maxNight: Int? { __data["maxNight"] }
        public var basePrice: Double? { __data["basePrice"] }
        public var cleaningPrice: Double? { __data["cleaningPrice"] }
        public var currency: String? { __data["currency"] }
        public var weeklyDiscount: Int? { __data["weeklyDiscount"] }
        public var monthlyDiscount: Int? { __data["monthlyDiscount"] }
        public var blockedDates: [String?]? { __data["blockedDates"] }
      }
    }
  }
}
