// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ConfirmPayoutMutation: GraphQLMutation {
    static let operationName: String = "confirmPayout"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation confirmPayout($currentAccountId: String) { confirmPayout(currentAccountId: $currentAccountId) { __typename status errorMessage } }"#
      ))

    public var currentAccountId: GraphQLNullable<String>

    public init(currentAccountId: GraphQLNullable<String>) {
      self.currentAccountId = currentAccountId
    }

    public var __variables: Variables? { ["currentAccountId": currentAccountId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("confirmPayout", ConfirmPayout?.self, arguments: ["currentAccountId": .variable("currentAccountId")]),
      ] }

      var confirmPayout: ConfirmPayout? { __data["confirmPayout"] }

      /// ConfirmPayout
      ///
      /// Parent Type: `PayoutWholeType`
      struct ConfirmPayout: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.PayoutWholeType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}