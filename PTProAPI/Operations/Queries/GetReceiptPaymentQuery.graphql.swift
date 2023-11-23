// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetReceiptPaymentQuery: GraphQLQuery {
    static let operationName: String = "getReceiptPayment"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getReceiptPayment($userId: String) { getReceiptPayment(userId: $userId) { __typename errorMessage status data { __typename transactionId total currency createdAt expiryDate planType planId paymentType } } }"#
      ))

    public var userId: GraphQLNullable<String>

    public init(userId: GraphQLNullable<String>) {
      self.userId = userId
    }

    public var __variables: Variables? { ["userId": userId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getReceiptPayment", GetReceiptPayment?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var getReceiptPayment: GetReceiptPayment? { __data["getReceiptPayment"] }

      /// GetReceiptPayment
      ///
      /// Parent Type: `SubscriptionPaymentType`
      struct GetReceiptPayment: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SubscriptionPaymentType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("data", Data?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var data: Data? { __data["data"] }

        /// GetReceiptPayment.Data
        ///
        /// Parent Type: `TransactionType`
        struct Data: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.TransactionType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("transactionId", String?.self),
            .field("total", Double?.self),
            .field("currency", String?.self),
            .field("createdAt", String?.self),
            .field("expiryDate", String?.self),
            .field("planType", String?.self),
            .field("planId", Int?.self),
            .field("paymentType", String?.self),
          ] }

          var transactionId: String? { __data["transactionId"] }
          var total: Double? { __data["total"] }
          var currency: String? { __data["currency"] }
          var createdAt: String? { __data["createdAt"] }
          var expiryDate: String? { __data["expiryDate"] }
          var planType: String? { __data["planType"] }
          var planId: Int? { __data["planId"] }
          var paymentType: String? { __data["paymentType"] }
        }
      }
    }
  }

}