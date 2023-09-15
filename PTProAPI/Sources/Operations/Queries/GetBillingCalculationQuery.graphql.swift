// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetBillingCalculationQuery: GraphQLQuery {
  public static let operationName: String = "getBillingCalculation"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getBillingCalculation($listId: Int!, $startDate: String!, $endDate: String!, $guests: Int!, $convertCurrency: String!) {
        getBillingCalculation(
          listId: $listId
          startDate: $startDate
          endDate: $endDate
          guests: $guests
          convertCurrency: $convertCurrency
        ) {
          __typename
          result {
            __typename
            checkIn
            checkOut
            nights
            basePrice
            cleaningPrice
            guests
            currency
            guestServiceFeePercentage
            hostServiceFeePercentage
            weeklyDiscountPercentage
            monthlyDiscountPercentage
            guestServiceFee
            hostServiceFee
            discountLabel
            discount
            subtotal
            total
            averagePrice
            priceForDays
            specialPricing {
              __typename
              blockedDates
              isSpecialPrice
            }
            isSpecialPriceAssigned
          }
          status
          errorMessage
        }
      }
      """
    ))

  public var listId: Int
  public var startDate: String
  public var endDate: String
  public var guests: Int
  public var convertCurrency: String

  public init(
    listId: Int,
    startDate: String,
    endDate: String,
    guests: Int,
    convertCurrency: String
  ) {
    self.listId = listId
    self.startDate = startDate
    self.endDate = endDate
    self.guests = guests
    self.convertCurrency = convertCurrency
  }

  public var __variables: Variables? { [
    "listId": listId,
    "startDate": startDate,
    "endDate": endDate,
    "guests": guests,
    "convertCurrency": convertCurrency
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getBillingCalculation", GetBillingCalculation?.self, arguments: [
        "listId": .variable("listId"),
        "startDate": .variable("startDate"),
        "endDate": .variable("endDate"),
        "guests": .variable("guests"),
        "convertCurrency": .variable("convertCurrency")
      ]),
    ] }

    public var getBillingCalculation: GetBillingCalculation? { __data["getBillingCalculation"] }

    /// GetBillingCalculation
    ///
    /// Parent Type: `AllBillingType`
    public struct GetBillingCalculation: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllBillingType }
      public static var __selections: [Selection] { [
        .field("result", Result?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: Result? { __data["result"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetBillingCalculation.Result
      ///
      /// Parent Type: `BillingType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.BillingType }
        public static var __selections: [Selection] { [
          .field("checkIn", String?.self),
          .field("checkOut", String?.self),
          .field("nights", Int?.self),
          .field("basePrice", Double?.self),
          .field("cleaningPrice", Double?.self),
          .field("guests", Int?.self),
          .field("currency", String?.self),
          .field("guestServiceFeePercentage", Double?.self),
          .field("hostServiceFeePercentage", Double?.self),
          .field("weeklyDiscountPercentage", Double?.self),
          .field("monthlyDiscountPercentage", Double?.self),
          .field("guestServiceFee", Double?.self),
          .field("hostServiceFee", Double?.self),
          .field("discountLabel", String?.self),
          .field("discount", Double?.self),
          .field("subtotal", Double?.self),
          .field("total", Double?.self),
          .field("averagePrice", Double?.self),
          .field("priceForDays", Double?.self),
          .field("specialPricing", [SpecialPricing?]?.self),
          .field("isSpecialPriceAssigned", Bool?.self),
        ] }

        public var checkIn: String? { __data["checkIn"] }
        public var checkOut: String? { __data["checkOut"] }
        public var nights: Int? { __data["nights"] }
        public var basePrice: Double? { __data["basePrice"] }
        public var cleaningPrice: Double? { __data["cleaningPrice"] }
        public var guests: Int? { __data["guests"] }
        public var currency: String? { __data["currency"] }
        public var guestServiceFeePercentage: Double? { __data["guestServiceFeePercentage"] }
        public var hostServiceFeePercentage: Double? { __data["hostServiceFeePercentage"] }
        public var weeklyDiscountPercentage: Double? { __data["weeklyDiscountPercentage"] }
        public var monthlyDiscountPercentage: Double? { __data["monthlyDiscountPercentage"] }
        public var guestServiceFee: Double? { __data["guestServiceFee"] }
        public var hostServiceFee: Double? { __data["hostServiceFee"] }
        public var discountLabel: String? { __data["discountLabel"] }
        public var discount: Double? { __data["discount"] }
        public var subtotal: Double? { __data["subtotal"] }
        public var total: Double? { __data["total"] }
        public var averagePrice: Double? { __data["averagePrice"] }
        public var priceForDays: Double? { __data["priceForDays"] }
        public var specialPricing: [SpecialPricing?]? { __data["specialPricing"] }
        public var isSpecialPriceAssigned: Bool? { __data["isSpecialPriceAssigned"] }

        /// GetBillingCalculation.Result.SpecialPricing
        ///
        /// Parent Type: `SpecialPricingType`
        public struct SpecialPricing: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.SpecialPricingType }
          public static var __selections: [Selection] { [
            .field("blockedDates", String?.self),
            .field("isSpecialPrice", Double?.self),
          ] }

          public var blockedDates: String? { __data["blockedDates"] }
          public var isSpecialPrice: Double? { __data["isSpecialPrice"] }
        }
      }
    }
  }
}
