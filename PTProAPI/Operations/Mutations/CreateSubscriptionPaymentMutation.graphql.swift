// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateSubscriptionPaymentMutation: GraphQLMutation {
    static let operationName: String = "createSubscriptionPayment"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation createSubscriptionPayment($userId: String, $planId: Int, $total: Float!, $paymentType: Int, $paymentCurrency: String, $cardToken: String, $currency: String!, $planType: String!, $totaldiscount: Float, $couponCode: String) { createSubscriptionPayment( userId: $userId total: $total planId: $planId paymentType: $paymentType paymentCurrency: $paymentCurrency cardToken: $cardToken currency: $currency planType: $planType totaldiscount: $totaldiscount couponCode: $couponCode ) { __typename results { __typename id } status errorMessage requireAdditionalAction paymentIntentSecret reservationId redirectUrl } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var planId: GraphQLNullable<Int>
    public var total: Double
    public var paymentType: GraphQLNullable<Int>
    public var paymentCurrency: GraphQLNullable<String>
    public var cardToken: GraphQLNullable<String>
    public var currency: String
    public var planType: String
    public var totaldiscount: GraphQLNullable<Double>
    public var couponCode: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      planId: GraphQLNullable<Int>,
      total: Double,
      paymentType: GraphQLNullable<Int>,
      paymentCurrency: GraphQLNullable<String>,
      cardToken: GraphQLNullable<String>,
      currency: String,
      planType: String,
      totaldiscount: GraphQLNullable<Double>,
      couponCode: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.planId = planId
      self.total = total
      self.paymentType = paymentType
      self.paymentCurrency = paymentCurrency
      self.cardToken = cardToken
      self.currency = currency
      self.planType = planType
      self.totaldiscount = totaldiscount
      self.couponCode = couponCode
    }

    public var __variables: Variables? { [
      "userId": userId,
      "planId": planId,
      "total": total,
      "paymentType": paymentType,
      "paymentCurrency": paymentCurrency,
      "cardToken": cardToken,
      "currency": currency,
      "planType": planType,
      "totaldiscount": totaldiscount,
      "couponCode": couponCode
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createSubscriptionPayment", CreateSubscriptionPayment?.self, arguments: [
          "userId": .variable("userId"),
          "total": .variable("total"),
          "planId": .variable("planId"),
          "paymentType": .variable("paymentType"),
          "paymentCurrency": .variable("paymentCurrency"),
          "cardToken": .variable("cardToken"),
          "currency": .variable("currency"),
          "planType": .variable("planType"),
          "totaldiscount": .variable("totaldiscount"),
          "couponCode": .variable("couponCode")
        ]),
      ] }

      var createSubscriptionPayment: CreateSubscriptionPayment? { __data["createSubscriptionPayment"] }

      /// CreateSubscriptionPayment
      ///
      /// Parent Type: `SubscriptionPaymentType`
      struct CreateSubscriptionPayment: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SubscriptionPaymentType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("requireAdditionalAction", Bool?.self),
          .field("paymentIntentSecret", String?.self),
          .field("reservationId", Int?.self),
          .field("redirectUrl", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var requireAdditionalAction: Bool? { __data["requireAdditionalAction"] }
        var paymentIntentSecret: String? { __data["paymentIntentSecret"] }
        var reservationId: Int? { __data["reservationId"] }
        var redirectUrl: String? { __data["redirectUrl"] }

        /// CreateSubscriptionPayment.Results
        ///
        /// Parent Type: `Reservation`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
          ] }

          var id: Int? { __data["id"] }
        }
      }
    }
  }

}