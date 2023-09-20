// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ResendConfirmEmailQuery: GraphQLQuery {
    static let operationName: String = "ResendConfirmEmail"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query ResendConfirmEmail { ResendConfirmEmail { __typename results { __typename id userId profile { __typename firstName userData { __typename email } } token email status } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("ResendConfirmEmail", ResendConfirmEmail?.self),
      ] }

      var resendConfirmEmail: ResendConfirmEmail? { __data["ResendConfirmEmail"] }

      /// ResendConfirmEmail
      ///
      /// Parent Type: `AllEmailToken`
      struct ResendConfirmEmail: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllEmailToken }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// ResendConfirmEmail.Results
        ///
        /// Parent Type: `EmailToken`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.EmailToken }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", String?.self),
            .field("userId", String?.self),
            .field("profile", Profile?.self),
            .field("token", String?.self),
            .field("email", String?.self),
            .field("status", String?.self),
          ] }

          var id: String? { __data["id"] }
          var userId: String? { __data["userId"] }
          var profile: Profile? { __data["profile"] }
          var token: String? { __data["token"] }
          var email: String? { __data["email"] }
          var status: String? { __data["status"] }

          /// ResendConfirmEmail.Results.Profile
          ///
          /// Parent Type: `UserProfile`
          struct Profile: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("firstName", String?.self),
              .field("userData", UserData?.self),
            ] }

            var firstName: String? { __data["firstName"] }
            var userData: UserData? { __data["userData"] }

            /// ResendConfirmEmail.Results.Profile.UserData
            ///
            /// Parent Type: `UserType`
            struct UserData: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("email", String?.self),
              ] }

              var email: String? { __data["email"] }
            }
          }
        }
      }
    }
  }

}