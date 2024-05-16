// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CancelmembershipQuery: GraphQLQuery {
    static let operationName: String = "Cancelmembership"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query Cancelmembership($userId: String!) { Cancelmembership(userId: $userId) { __typename status errorMessage } }"#
      ))

    public var userId: String

    public init(userId: String) {
      self.userId = userId
    }

    public var __variables: Variables? { ["userId": userId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("Cancelmembership", Cancelmembership?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var cancelmembership: Cancelmembership? { __data["Cancelmembership"] }

      /// Cancelmembership
      ///
      /// Parent Type: `SubscriptionPaymentType`
      struct Cancelmembership: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SubscriptionPaymentType }
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