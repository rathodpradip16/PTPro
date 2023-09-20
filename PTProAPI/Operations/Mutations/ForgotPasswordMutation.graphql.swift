// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ForgotPasswordMutation: GraphQLMutation {
    static let operationName: String = "ForgotPassword"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation ForgotPassword($email: String!) { userForgotPassword(email: $email) { __typename status forgotLink errorMessage } }"#
      ))

    public var email: String

    public init(email: String) {
      self.email = email
    }

    public var __variables: Variables? { ["email": email] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("userForgotPassword", UserForgotPassword?.self, arguments: ["email": .variable("email")]),
      ] }

      var userForgotPassword: UserForgotPassword? { __data["userForgotPassword"] }

      /// UserForgotPassword
      ///
      /// Parent Type: `UserType`
      struct UserForgotPassword: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("forgotLink", String?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var forgotLink: String? { __data["forgotLink"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}