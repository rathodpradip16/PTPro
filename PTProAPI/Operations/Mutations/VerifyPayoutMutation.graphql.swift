// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class VerifyPayoutMutation: GraphQLMutation {
    static let operationName: String = "verifyPayout"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation verifyPayout($stripeAccount: String) { verifyPayout(stripeAccount: $stripeAccount) { __typename status connectUrl successUrl failureUrl stripeAccountId errorMessage } }"#
      ))

    public var stripeAccount: GraphQLNullable<String>

    public init(stripeAccount: GraphQLNullable<String>) {
      self.stripeAccount = stripeAccount
    }

    public var __variables: Variables? { ["stripeAccount": stripeAccount] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("verifyPayout", VerifyPayout?.self, arguments: ["stripeAccount": .variable("stripeAccount")]),
      ] }

      var verifyPayout: VerifyPayout? { __data["verifyPayout"] }

      /// VerifyPayout
      ///
      /// Parent Type: `GetPayoutType`
      struct VerifyPayout: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPayoutType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("connectUrl", String?.self),
          .field("successUrl", String?.self),
          .field("failureUrl", String?.self),
          .field("stripeAccountId", String?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var connectUrl: String? { __data["connectUrl"] }
        var successUrl: String? { __data["successUrl"] }
        var failureUrl: String? { __data["failureUrl"] }
        var stripeAccountId: String? { __data["stripeAccountId"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}