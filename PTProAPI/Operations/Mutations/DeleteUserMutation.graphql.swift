// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class DeleteUserMutation: GraphQLMutation {
    static let operationName: String = "deleteUser"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation deleteUser { deleteUser { __typename status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("deleteUser", DeleteUser?.self),
      ] }

      var deleteUser: DeleteUser? { __data["deleteUser"] }

      /// DeleteUser
      ///
      /// Parent Type: `UserCommon`
      struct DeleteUser: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserCommon }
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