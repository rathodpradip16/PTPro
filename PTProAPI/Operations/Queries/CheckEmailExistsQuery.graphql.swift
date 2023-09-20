// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CheckEmailExistsQuery: GraphQLQuery {
    static let operationName: String = "CheckEmailExists"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query CheckEmailExists($email: String!) { validateEmailExist(email: $email) { __typename status errorMessage } }"#
      ))

    public var email: String

    public init(email: String) {
      self.email = email
    }

    public var __variables: Variables? { ["email": email] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("validateEmailExist", ValidateEmailExist?.self, arguments: ["email": .variable("email")]),
      ] }

      var validateEmailExist: ValidateEmailExist? { __data["validateEmailExist"] }

      /// ValidateEmailExist
      ///
      /// Parent Type: `CommonType`
      struct ValidateEmailExist: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CommonType }
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