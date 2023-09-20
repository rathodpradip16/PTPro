// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class LoginQuery: GraphQLQuery {
    static let operationName: String = "Login"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query Login($email: String!, $password: String!, $deviceType: String!, $deviceDetail: String, $deviceId: String!) { userLogin( email: $email password: $password deviceType: $deviceType deviceDetail: $deviceDetail deviceId: $deviceId ) { __typename result { __typename userId userToken user { __typename firstName lastName gender dateOfBirth phoneNumber preferredLanguage preferredCurrency createdAt picture verification { __typename id isPhoneVerified isEmailConfirmed isIdVerification isGoogleConnected isFacebookConnected } userData { __typename type } } } status errorMessage } }"#
      ))

    public var email: String
    public var password: String
    public var deviceType: String
    public var deviceDetail: GraphQLNullable<String>
    public var deviceId: String

    public init(
      email: String,
      password: String,
      deviceType: String,
      deviceDetail: GraphQLNullable<String>,
      deviceId: String
    ) {
      self.email = email
      self.password = password
      self.deviceType = deviceType
      self.deviceDetail = deviceDetail
      self.deviceId = deviceId
    }

    public var __variables: Variables? { [
      "email": email,
      "password": password,
      "deviceType": deviceType,
      "deviceDetail": deviceDetail,
      "deviceId": deviceId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("userLogin", UserLogin?.self, arguments: [
          "email": .variable("email"),
          "password": .variable("password"),
          "deviceType": .variable("deviceType"),
          "deviceDetail": .variable("deviceDetail"),
          "deviceId": .variable("deviceId")
        ]),
      ] }

      var userLogin: UserLogin? { __data["userLogin"] }

      /// UserLogin
      ///
      /// Parent Type: `UserCommon`
      struct UserLogin: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", Result?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: Result? { __data["result"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// UserLogin.Result
        ///
        /// Parent Type: `UserType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("userToken", String?.self),
            .field("user", User?.self),
          ] }

          var userId: String? { __data["userId"] }
          var userToken: String? { __data["userToken"] }
          var user: User? { __data["user"] }

          /// UserLogin.Result.User
          ///
          /// Parent Type: `UserEditProfile`
          struct User: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserEditProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("firstName", String?.self),
              .field("lastName", String?.self),
              .field("gender", String?.self),
              .field("dateOfBirth", String?.self),
              .field("phoneNumber", String?.self),
              .field("preferredLanguage", String?.self),
              .field("preferredCurrency", String?.self),
              .field("createdAt", String?.self),
              .field("picture", String?.self),
              .field("verification", Verification?.self),
              .field("userData", UserData?.self),
            ] }

            var firstName: String? { __data["firstName"] }
            var lastName: String? { __data["lastName"] }
            var gender: String? { __data["gender"] }
            var dateOfBirth: String? { __data["dateOfBirth"] }
            var phoneNumber: String? { __data["phoneNumber"] }
            var preferredLanguage: String? { __data["preferredLanguage"] }
            var preferredCurrency: String? { __data["preferredCurrency"] }
            var createdAt: String? { __data["createdAt"] }
            var picture: String? { __data["picture"] }
            var verification: Verification? { __data["verification"] }
            var userData: UserData? { __data["userData"] }

            /// UserLogin.Result.User.Verification
            ///
            /// Parent Type: `UserVerifiedInfo`
            struct Verification: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserVerifiedInfo }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", Int?.self),
                .field("isPhoneVerified", Bool?.self),
                .field("isEmailConfirmed", Bool?.self),
                .field("isIdVerification", Bool?.self),
                .field("isGoogleConnected", Bool?.self),
                .field("isFacebookConnected", Bool?.self),
              ] }

              var id: Int? { __data["id"] }
              var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
              var isEmailConfirmed: Bool? { __data["isEmailConfirmed"] }
              var isIdVerification: Bool? { __data["isIdVerification"] }
              var isGoogleConnected: Bool? { __data["isGoogleConnected"] }
              var isFacebookConnected: Bool? { __data["isFacebookConnected"] }
            }

            /// UserLogin.Result.User.UserData
            ///
            /// Parent Type: `UserProfile`
            struct UserData: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("type", String?.self),
              ] }

              var type: String? { __data["type"] }
            }
          }
        }
      }
    }
  }

}