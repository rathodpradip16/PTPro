// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class EmailVerificationMutation: GraphQLMutation {
    static let operationName: String = "EmailVerification"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation EmailVerification($token: String!, $email: String!) { EmailVerification(token: $token, email: $email) { __typename status errorMessage } }"#
      ))

    public var token: String
    public var email: String

    public init(
      token: String,
      email: String
    ) {
      self.token = token
      self.email = email
    }

    public var __variables: Variables? { [
      "token": token,
      "email": email
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("EmailVerification", EmailVerification?.self, arguments: [
          "token": .variable("token"),
          "email": .variable("email")
        ]),
      ] }

      var emailVerification: EmailVerification? { __data["EmailVerification"] }

      /// EmailVerification
      ///
      /// Parent Type: `AllEmailToken`
      struct EmailVerification: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllEmailToken }
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