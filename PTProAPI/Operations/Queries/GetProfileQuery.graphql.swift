// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetProfileQuery: GraphQLQuery {
    static let operationName: String = "GetProfile"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query GetProfile { userAccount { __typename result { __typename userId profileId firstName lastName displayName gender dateOfBirth iosDOB email userBanStatus phoneNumber preferredLanguage preferredLanguageName preferredCurrency appTheme location info createdAt picture country loginUserType isAddedList verification { __typename id isEmailConfirmed isFacebookConnected isGoogleConnected isIdVerification isPhoneVerified } userData { __typename type } verificationCode countryCode loginUserType isAddedList } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("userAccount", UserAccount?.self),
      ] }

      var userAccount: UserAccount? { __data["userAccount"] }

      /// UserAccount
      ///
      /// Parent Type: `WholeAccount`
      struct UserAccount: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.WholeAccount }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", Result?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: Result? { __data["result"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// UserAccount.Result
        ///
        /// Parent Type: `UserAccount`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", PTProAPI.ID?.self),
            .field("profileId", Int?.self),
            .field("firstName", String?.self),
            .field("lastName", String?.self),
            .field("displayName", String?.self),
            .field("gender", String?.self),
            .field("dateOfBirth", String?.self),
            .field("iosDOB", String?.self),
            .field("email", String?.self),
            .field("userBanStatus", Int?.self),
            .field("phoneNumber", String?.self),
            .field("preferredLanguage", String?.self),
            .field("preferredLanguageName", String?.self),
            .field("preferredCurrency", String?.self),
            .field("appTheme", String?.self),
            .field("location", String?.self),
            .field("info", String?.self),
            .field("createdAt", String?.self),
            .field("picture", String?.self),
            .field("country", Int?.self),
            .field("loginUserType", String?.self),
            .field("isAddedList", Bool?.self),
            .field("verification", Verification?.self),
            .field("userData", UserData?.self),
            .field("verificationCode", Int?.self),
            .field("countryCode", String?.self),
          ] }

          var userId: PTProAPI.ID? { __data["userId"] }
          var profileId: Int? { __data["profileId"] }
          var firstName: String? { __data["firstName"] }
          var lastName: String? { __data["lastName"] }
          var displayName: String? { __data["displayName"] }
          var gender: String? { __data["gender"] }
          var dateOfBirth: String? { __data["dateOfBirth"] }
          var iosDOB: String? { __data["iosDOB"] }
          var email: String? { __data["email"] }
          var userBanStatus: Int? { __data["userBanStatus"] }
          var phoneNumber: String? { __data["phoneNumber"] }
          var preferredLanguage: String? { __data["preferredLanguage"] }
          var preferredLanguageName: String? { __data["preferredLanguageName"] }
          var preferredCurrency: String? { __data["preferredCurrency"] }
          var appTheme: String? { __data["appTheme"] }
          var location: String? { __data["location"] }
          var info: String? { __data["info"] }
          var createdAt: String? { __data["createdAt"] }
          var picture: String? { __data["picture"] }
          var country: Int? { __data["country"] }
          var loginUserType: String? { __data["loginUserType"] }
          var isAddedList: Bool? { __data["isAddedList"] }
          var verification: Verification? { __data["verification"] }
          var userData: UserData? { __data["userData"] }
          var verificationCode: Int? { __data["verificationCode"] }
          var countryCode: String? { __data["countryCode"] }

          /// UserAccount.Result.Verification
          ///
          /// Parent Type: `UserVerifiedInfo`
          struct Verification: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserVerifiedInfo }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("isEmailConfirmed", Bool?.self),
              .field("isFacebookConnected", Bool?.self),
              .field("isGoogleConnected", Bool?.self),
              .field("isIdVerification", Bool?.self),
              .field("isPhoneVerified", Bool?.self),
            ] }

            var id: Int? { __data["id"] }
            var isEmailConfirmed: Bool? { __data["isEmailConfirmed"] }
            var isFacebookConnected: Bool? { __data["isFacebookConnected"] }
            var isGoogleConnected: Bool? { __data["isGoogleConnected"] }
            var isIdVerification: Bool? { __data["isIdVerification"] }
            var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
          }

          /// UserAccount.Result.UserData
          ///
          /// Parent Type: `UserType`
          struct UserData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
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