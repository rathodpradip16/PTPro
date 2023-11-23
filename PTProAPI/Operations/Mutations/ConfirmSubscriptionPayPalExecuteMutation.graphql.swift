// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ConfirmSubscriptionPayPalExecuteMutation: GraphQLMutation {
    static let operationName: String = "confirmSubscriptionPayPalExecute"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation confirmSubscriptionPayPalExecute($paymentId: String!, $payerId: String!, $userId: String!) { confirmSubscriptionPayPalExecute( userId: $userId paymentId: $paymentId payerId: $payerId ) { __typename results { __typename id total confirmationCode createdAt reservationState paymentState } status errorMessage reservationId } }"#
      ))

    public var paymentId: String
    public var payerId: String
    public var userId: String

    public init(
      paymentId: String,
      payerId: String,
      userId: String
    ) {
      self.paymentId = paymentId
      self.payerId = payerId
      self.userId = userId
    }

    public var __variables: Variables? { [
      "paymentId": paymentId,
      "payerId": payerId,
      "userId": userId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("confirmSubscriptionPayPalExecute", ConfirmSubscriptionPayPalExecute?.self, arguments: [
          "userId": .variable("userId"),
          "paymentId": .variable("paymentId"),
          "payerId": .variable("payerId")
        ]),
      ] }

      var confirmSubscriptionPayPalExecute: ConfirmSubscriptionPayPalExecute? { __data["confirmSubscriptionPayPalExecute"] }

      /// ConfirmSubscriptionPayPalExecute
      ///
      /// Parent Type: `SubscriptionPaymentType`
      struct ConfirmSubscriptionPayPalExecute: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SubscriptionPaymentType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("reservationId", Int?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var reservationId: Int? { __data["reservationId"] }

        /// ConfirmSubscriptionPayPalExecute.Results
        ///
        /// Parent Type: `Reservation`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("total", Double?.self),
            .field("confirmationCode", Int?.self),
            .field("createdAt", String?.self),
            .field("reservationState", String?.self),
            .field("paymentState", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var total: Double? { __data["total"] }
          var confirmationCode: Int? { __data["confirmationCode"] }
          var createdAt: String? { __data["createdAt"] }
          var reservationState: String? { __data["reservationState"] }
          var paymentState: String? { __data["paymentState"] }
        }
      }
    }
  }

}