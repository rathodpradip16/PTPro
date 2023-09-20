// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPayoutsQuery: GraphQLQuery {
    static let operationName: String = "getPayouts"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPayouts { getPayouts { __typename results { __typename id methodId paymentMethod { __typename id name } userId payEmail address1 address2 city default state country zipcode currency default createdAt last4Digits isVerified status } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPayouts", GetPayouts?.self),
      ] }

      var getPayouts: GetPayouts? { __data["getPayouts"] }

      /// GetPayouts
      ///
      /// Parent Type: `PayoutWholeType`
      struct GetPayouts: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.PayoutWholeType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
        ] }

        var results: [Result?]? { __data["results"] }

        /// GetPayouts.Result
        ///
        /// Parent Type: `Payout`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Payout }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("methodId", Int?.self),
            .field("paymentMethod", PaymentMethod?.self),
            .field("userId", String?.self),
            .field("payEmail", String?.self),
            .field("address1", String?.self),
            .field("address2", String?.self),
            .field("city", String?.self),
            .field("default", Bool?.self),
            .field("state", String?.self),
            .field("country", String?.self),
            .field("zipcode", String?.self),
            .field("currency", String?.self),
            .field("createdAt", String?.self),
            .field("last4Digits", Int?.self),
            .field("isVerified", Bool?.self),
            .field("status", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var methodId: Int? { __data["methodId"] }
          var paymentMethod: PaymentMethod? { __data["paymentMethod"] }
          var userId: String? { __data["userId"] }
          var payEmail: String? { __data["payEmail"] }
          var address1: String? { __data["address1"] }
          var address2: String? { __data["address2"] }
          var city: String? { __data["city"] }
          var `default`: Bool? { __data["default"] }
          var state: String? { __data["state"] }
          var country: String? { __data["country"] }
          var zipcode: String? { __data["zipcode"] }
          var currency: String? { __data["currency"] }
          var createdAt: String? { __data["createdAt"] }
          var last4Digits: Int? { __data["last4Digits"] }
          var isVerified: Bool? { __data["isVerified"] }
          var status: Int? { __data["status"] }

          /// GetPayouts.Result.PaymentMethod
          ///
          /// Parent Type: `PaymentMethods`
          struct PaymentMethod: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.PaymentMethods }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("name", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var name: String? { __data["name"] }
          }
        }
      }
    }
  }

}