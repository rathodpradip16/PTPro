// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ResetPasswordMutation: GraphQLMutation {
    static let operationName: String = "resetPassword"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation resetPassword($email: String!, $password: String!, $token: String!) { updateForgotPassword(email: $email, password: $password, token: $token) { __typename status errorMessage } }"#
      ))

    public var email: String
    public var password: String
    public var token: String

    public init(
      email: String,
      password: String,
      token: String
    ) {
      self.email = email
      self.password = password
      self.token = token
    }

    public var __variables: Variables? { [
      "email": email,
      "password": password,
      "token": token
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("updateForgotPassword", UpdateForgotPassword?.self, arguments: [
          "email": .variable("email"),
          "password": .variable("password"),
          "token": .variable("token")
        ]),
      ] }

      var updateForgotPassword: UpdateForgotPassword? { __data["updateForgotPassword"] }

      /// UpdateForgotPassword
      ///
      /// Parent Type: `UserType`
      struct UpdateForgotPassword: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
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