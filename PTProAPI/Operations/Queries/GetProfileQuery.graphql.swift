// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetProfileQuery: GraphQLQuery {
  public static let operationName: String = "GetProfile"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query GetProfile { userAccount { __typename result { __typename userId profileId firstName lastName displayName gender dateOfBirth iosDOB email userBanStatus phoneNumber preferredLanguage preferredLanguageName preferredCurrency appTheme location info createdAt picture country loginUserType isAddedList verification { __typename id isEmailConfirmed isFacebookConnected isGoogleConnected isIdVerification isPhoneVerified } userData { __typename type } verificationCode countryCode loginUserType isAddedList } status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("userAccount", UserAccount?.self),
    ] }

    public var userAccount: UserAccount? { __data["userAccount"] }

    /// UserAccount
    ///
    /// Parent Type: `WholeAccount`
    public struct UserAccount: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.WholeAccount }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("result", Result?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: Result? { __data["result"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// UserAccount.Result
      ///
      /// Parent Type: `UserAccount`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
        public static var __selections: [Apollo.Selection] { [
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

        public var userId: PTProAPI.ID? { __data["userId"] }
        public var profileId: Int? { __data["profileId"] }
        public var firstName: String? { __data["firstName"] }
        public var lastName: String? { __data["lastName"] }
        public var displayName: String? { __data["displayName"] }
        public var gender: String? { __data["gender"] }
        public var dateOfBirth: String? { __data["dateOfBirth"] }
        public var iosDOB: String? { __data["iosDOB"] }
        public var email: String? { __data["email"] }
        public var userBanStatus: Int? { __data["userBanStatus"] }
        public var phoneNumber: String? { __data["phoneNumber"] }
        public var preferredLanguage: String? { __data["preferredLanguage"] }
        public var preferredLanguageName: String? { __data["preferredLanguageName"] }
        public var preferredCurrency: String? { __data["preferredCurrency"] }
        public var appTheme: String? { __data["appTheme"] }
        public var location: String? { __data["location"] }
        public var info: String? { __data["info"] }
        public var createdAt: String? { __data["createdAt"] }
        public var picture: String? { __data["picture"] }
        public var country: Int? { __data["country"] }
        public var loginUserType: String? { __data["loginUserType"] }
        public var isAddedList: Bool? { __data["isAddedList"] }
        public var verification: Verification? { __data["verification"] }
        public var userData: UserData? { __data["userData"] }
        public var verificationCode: Int? { __data["verificationCode"] }
        public var countryCode: String? { __data["countryCode"] }

        /// UserAccount.Result.Verification
        ///
        /// Parent Type: `UserVerifiedInfo`
        public struct Verification: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserVerifiedInfo }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("isEmailConfirmed", Bool?.self),
            .field("isFacebookConnected", Bool?.self),
            .field("isGoogleConnected", Bool?.self),
            .field("isIdVerification", Bool?.self),
            .field("isPhoneVerified", Bool?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var isEmailConfirmed: Bool? { __data["isEmailConfirmed"] }
          public var isFacebookConnected: Bool? { __data["isFacebookConnected"] }
          public var isGoogleConnected: Bool? { __data["isGoogleConnected"] }
          public var isIdVerification: Bool? { __data["isIdVerification"] }
          public var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
        }

        /// UserAccount.Result.UserData
        ///
        /// Parent Type: `UserType`
        public struct UserData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("type", String?.self),
          ] }

          public var type: String? { __data["type"] }
        }
      }
    }
  }
}