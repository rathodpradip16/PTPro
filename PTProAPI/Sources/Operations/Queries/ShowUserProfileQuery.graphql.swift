// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ShowUserProfileQuery: GraphQLQuery {
  public static let operationName: String = "showUserProfile"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query showUserProfile($profileId: Int, $isUser: Boolean) {
        showUserProfile(profileId: $profileId, isUser: $isUser) {
          __typename
          results {
            __typename
            userId
            profileId
            firstName
            lastName
            dateOfBirth
            gender
            phoneNumber
            preferredLanguage
            preferredCurrency
            location
            info
            createdAt
            picture
            reviewsCount
            userVerifiedInfo {
              __typename
              id
              isEmailConfirmed
              isFacebookConnected
              isGoogleConnected
              isIdVerification
              isPhoneVerified
              status
            }
          }
          status
          errorMessage
        }
      }
      """
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("showUserProfile", ShowUserProfile?.self, arguments: [
        "profileId": .variable("profileId"),
        "isUser": .variable("isUser")
      ]),
    ] }

    public var showUserProfile: ShowUserProfile? { __data["showUserProfile"] }

    /// ShowUserProfile
    ///
    /// Parent Type: `ShowUserProfileCommon`
    public struct ShowUserProfile: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ShowUserProfileCommon }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ShowUserProfile.Results
      ///
      /// Parent Type: `ShowUserProfile`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.ShowUserProfile }
        public static var __selections: [Selection] { [
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

        public var userId: String? { __data["userId"] }
        public var profileId: Int? { __data["profileId"] }
        public var firstName: String? { __data["firstName"] }
        public var lastName: String? { __data["lastName"] }
        public var dateOfBirth: String? { __data["dateOfBirth"] }
        public var gender: String? { __data["gender"] }
        public var phoneNumber: String? { __data["phoneNumber"] }
        public var preferredLanguage: String? { __data["preferredLanguage"] }
        public var preferredCurrency: String? { __data["preferredCurrency"] }
        public var location: String? { __data["location"] }
        public var info: String? { __data["info"] }
        public var createdAt: String? { __data["createdAt"] }
        public var picture: String? { __data["picture"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var userVerifiedInfo: UserVerifiedInfo? { __data["userVerifiedInfo"] }

        /// ShowUserProfile.Results.UserVerifiedInfo
        ///
        /// Parent Type: `UserVerifiedInfo`
        public struct UserVerifiedInfo: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserVerifiedInfo }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("isEmailConfirmed", Bool?.self),
            .field("isFacebookConnected", Bool?.self),
            .field("isGoogleConnected", Bool?.self),
            .field("isIdVerification", Bool?.self),
            .field("isPhoneVerified", Bool?.self),
            .field("status", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var isEmailConfirmed: Bool? { __data["isEmailConfirmed"] }
          public var isFacebookConnected: Bool? { __data["isFacebookConnected"] }
          public var isGoogleConnected: Bool? { __data["isGoogleConnected"] }
          public var isIdVerification: Bool? { __data["isIdVerification"] }
          public var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
          public var status: String? { __data["status"] }
        }
      }
    }
  }
}
