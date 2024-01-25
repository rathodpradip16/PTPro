// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPropertieCountQuery: GraphQLQuery {
    static let operationName: String = "getPropertieCount"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPropertieCount($userId: String) { getPropertieCount(userId: $userId) { __typename errorMessage status results { __typename planId propertieCount } } }"#
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
        .field("getPropertieCount", GetPropertieCount?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var getPropertieCount: GetPropertieCount? { __data["getPropertieCount"] }

      /// GetPropertieCount
      ///
      /// Parent Type: `SubscriptionPaymentType`
      struct GetPropertieCount: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SubscriptionPaymentType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("results", Results?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var results: Results? { __data["results"] }

        /// GetPropertieCount.Results
        ///
        /// Parent Type: `Reservation`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("planId", Int?.self),
            .field("propertieCount", Int?.self),
          ] }

          var planId: Int? { __data["planId"] }
          var propertieCount: Int? { __data["propertieCount"] }
        }
      }
    }
  }

}