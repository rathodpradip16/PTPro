// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetBillingCalculationQuery: GraphQLQuery {
    static let operationName: String = "getBillingCalculation"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getBillingCalculation($listId: Int!, $startDate: String!, $endDate: String!, $guests: Int!, $convertCurrency: String!) { getBillingCalculation( listId: $listId startDate: $startDate endDate: $endDate guests: $guests convertCurrency: $convertCurrency ) { __typename result { __typename checkIn checkOut nights basePrice cleaningPrice guests currency guestServiceFeePercentage hostServiceFeePercentage weeklyDiscountPercentage monthlyDiscountPercentage guestServiceFee hostServiceFee discountLabel discount subtotal total averagePrice priceForDays specialPricing { __typename blockedDates isSpecialPrice } isSpecialPriceAssigned } status errorMessage } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getBillingCalculation", GetBillingCalculation?.self, arguments: [
          "listId": .variable("listId"),
          "startDate": .variable("startDate"),
          "endDate": .variable("endDate"),
          "guests": .variable("guests"),
          "convertCurrency": .variable("convertCurrency")
        ]),
      ] }

      var getBillingCalculation: GetBillingCalculation? { __data["getBillingCalculation"] }

      /// GetBillingCalculation
      ///
      /// Parent Type: `AllBillingType`
      struct GetBillingCalculation: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllBillingType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", Result?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: Result? { __data["result"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetBillingCalculation.Result
        ///
        /// Parent Type: `BillingType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.BillingType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
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

          var checkIn: String? { __data["checkIn"] }
          var checkOut: String? { __data["checkOut"] }
          var nights: Int? { __data["nights"] }
          var basePrice: Double? { __data["basePrice"] }
          var cleaningPrice: Double? { __data["cleaningPrice"] }
          var guests: Int? { __data["guests"] }
          var currency: String? { __data["currency"] }
          var guestServiceFeePercentage: Double? { __data["guestServiceFeePercentage"] }
          var hostServiceFeePercentage: Double? { __data["hostServiceFeePercentage"] }
          var weeklyDiscountPercentage: Double? { __data["weeklyDiscountPercentage"] }
          var monthlyDiscountPercentage: Double? { __data["monthlyDiscountPercentage"] }
          var guestServiceFee: Double? { __data["guestServiceFee"] }
          var hostServiceFee: Double? { __data["hostServiceFee"] }
          var discountLabel: String? { __data["discountLabel"] }
          var discount: Double? { __data["discount"] }
          var subtotal: Double? { __data["subtotal"] }
          var total: Double? { __data["total"] }
          var averagePrice: Double? { __data["averagePrice"] }
          var priceForDays: Double? { __data["priceForDays"] }
          var specialPricing: [SpecialPricing?]? { __data["specialPricing"] }
          var isSpecialPriceAssigned: Bool? { __data["isSpecialPriceAssigned"] }

          /// GetBillingCalculation.Result.SpecialPricing
          ///
          /// Parent Type: `SpecialPricingType`
          struct SpecialPricing: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.SpecialPricingType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("blockedDates", String?.self),
              .field("isSpecialPrice", Double?.self),
            ] }

            var blockedDates: String? { __data["blockedDates"] }
            var isSpecialPrice: Double? { __data["isSpecialPrice"] }
          }
        }
      }
    }
  }

}