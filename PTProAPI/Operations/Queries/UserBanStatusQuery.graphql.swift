// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UserBanStatusQuery: GraphQLQuery {
    static let operationName: String = "UserBanStatus"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query UserBanStatus { getUserBanStatus { __typename status userBanStatus errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getUserBanStatus", GetUserBanStatus?.self),
      ] }

      var getUserBanStatus: GetUserBanStatus? { __data["getUserBanStatus"] }

      /// GetUserBanStatus
      ///
      /// Parent Type: `UserType`
      struct GetUserBanStatus: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("userBanStatus", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var userBanStatus: Int? { __data["userBanStatus"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}