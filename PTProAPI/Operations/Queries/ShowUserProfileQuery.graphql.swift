// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ShowUserProfileQuery: GraphQLQuery {
    static let operationName: String = "showUserProfile"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query showUserProfile($profileId: Int, $isUser: Boolean) { showUserProfile(profileId: $profileId, isUser: $isUser) { __typename results { __typename userId profileId firstName lastName dateOfBirth gender phoneNumber preferredLanguage preferredCurrency location info createdAt picture reviewsCount userVerifiedInfo { __typename id isEmailConfirmed isFacebookConnected isGoogleConnected isIdVerification isPhoneVerified status } } status errorMessage } }"#
      ))

    public var profileId: GraphQLNullable<Int>
    public var isUser: GraphQLNullable<Bool>

    public init(
      profileId: GraphQLNullable<Int>,
      isUser: GraphQLNullable<Bool>
    ) {
      self.profileId = profileId
      self.isUser = isUser
    }

    public var __variables: Variables? { [
      "profileId": profileId,
      "isUser": isUser
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("showUserProfile", ShowUserProfile?.self, arguments: [
          "profileId": .variable("profileId"),
          "isUser": .variable("isUser")
        ]),
      ] }

      var showUserProfile: ShowUserProfile? { __data["showUserProfile"] }

      /// ShowUserProfile
      ///
      /// Parent Type: `ShowUserProfileCommon`
      struct ShowUserProfile: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowUserProfileCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// ShowUserProfile.Results
        ///
        /// Parent Type: `ShowUserProfile`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowUserProfile }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("firstName", String?.self),
            .field("lastName", String?.self),
            .field("dateOfBirth", String?.self),
            .field("gender", String?.self),
            .field("phoneNumber", String?.self),
            .field("preferredLanguage", String?.self),
            .field("preferredCurrency", String?.self),
            .field("location", String?.self),
            .field("info", String?.self),
            .field("createdAt", String?.self),
            .field("picture", String?.self),
            .field("reviewsCount", Int?.self),
            .field("userVerifiedInfo", UserVerifiedInfo?.self),
          ] }

          var userId: String? { __data["userId"] }
          var profileId: Int? { __data["profileId"] }
          var firstName: String? { __data["firstName"] }
          var lastName: String? { __data["lastName"] }
          var dateOfBirth: String? { __data["dateOfBirth"] }
          var gender: String? { __data["gender"] }
          var phoneNumber: String? { __data["phoneNumber"] }
          var preferredLanguage: String? { __data["preferredLanguage"] }
          var preferredCurrency: String? { __data["preferredCurrency"] }
          var location: String? { __data["location"] }
          var info: String? { __data["info"] }
          var createdAt: String? { __data["createdAt"] }
          var picture: String? { __data["picture"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var userVerifiedInfo: UserVerifiedInfo? { __data["userVerifiedInfo"] }

          /// ShowUserProfile.Results.UserVerifiedInfo
          ///
          /// Parent Type: `UserVerifiedInfo`
          struct UserVerifiedInfo: PTProAPI.SelectionSet {
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
              .field("status", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var isEmailConfirmed: Bool? { __data["isEmailConfirmed"] }
            var isFacebookConnected: Bool? { __data["isFacebookConnected"] }
            var isGoogleConnected: Bool? { __data["isGoogleConnected"] }
            var isIdVerification: Bool? { __data["isIdVerification"] }
            var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
            var status: String? { __data["status"] }
          }
        }
      }
    }
  }

}