// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetAffiliateUserStepSuccessQuery: GraphQLQuery {
    static let operationName: String = "getAffiliateUserStepSuccess"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getAffiliateUserStepSuccess($userId: String) { getAffiliateUserStepSuccess(userId: $userId) { __typename status errorMessage } }"#
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
        .field("getAffiliateUserStepSuccess", GetAffiliateUserStepSuccess?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var getAffiliateUserStepSuccess: GetAffiliateUserStepSuccess? { __data["getAffiliateUserStepSuccess"] }

      /// GetAffiliateUserStepSuccess
      ///
      /// Parent Type: `AffiliatestepType`
      struct GetAffiliateUserStepSuccess: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliatestepType }
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