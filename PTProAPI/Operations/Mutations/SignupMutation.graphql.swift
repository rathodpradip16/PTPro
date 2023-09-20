// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class SignupMutation: GraphQLMutation {
  public static let operationName: String = "Signup"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation Signup($firstName: String, $lastName: String, $email: String!, $password: String!, $dateOfBirth: String, $deviceType: String!, $deviceDetail: String, $deviceId: String!, $registerType: String) { createUser( firstName: $firstName lastName: $lastName email: $email password: $password dateOfBirth: $dateOfBirth deviceType: $deviceType deviceDetail: $deviceDetail deviceId: $deviceId registerType: $registerType ) { __typename result { __typename userId userToken user { __typename firstName lastName gender dateOfBirth phoneNumber preferredLanguage preferredCurrency createdAt picture verification { __typename id isPhoneVerified isEmailConfirmed isIdVerification isGoogleConnected isFacebookConnected } userData { __typename type } } } status errorMessage } }"#
    ))

  public var firstName: GraphQLNullable<String>
  public var lastName: GraphQLNullable<String>
  public var email: String
  public var password: String
  public var dateOfBirth: GraphQLNullable<String>
  public var deviceType: String
  public var deviceDetail: GraphQLNullable<String>
  public var deviceId: String
  public var registerType: GraphQLNullable<String>

  public init(
    firstName: GraphQLNullable<String>,
    lastName: GraphQLNullable<String>,
    email: String,
    password: String,
    dateOfBirth: GraphQLNullable<String>,
    deviceType: String,
    deviceDetail: GraphQLNullable<String>,
    deviceId: String,
    registerType: GraphQLNullable<String>
  ) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.password = password
    self.dateOfBirth = dateOfBirth
    self.deviceType = deviceType
    self.deviceDetail = deviceDetail
    self.deviceId = deviceId
    self.registerType = registerType
  }

  public var __variables: Variables? { [
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "dateOfBirth": dateOfBirth,
    "deviceType": deviceType,
    "deviceDetail": deviceDetail,
    "deviceId": deviceId,
    "registerType": registerType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("createUser", CreateUser?.self, arguments: [
        "firstName": .variable("firstName"),
        "lastName": .variable("lastName"),
        "email": .variable("email"),
        "password": .variable("password"),
        "dateOfBirth": .variable("dateOfBirth"),
        "deviceType": .variable("deviceType"),
        "deviceDetail": .variable("deviceDetail"),
        "deviceId": .variable("deviceId"),
        "registerType": .variable("registerType")
      ]),
    ] }

    public var createUser: CreateUser? { __data["createUser"] }

    /// CreateUser
    ///
    /// Parent Type: `UserCommon`
    public struct CreateUser: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserCommon }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("result", Result?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: Result? { __data["result"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// CreateUser.Result
      ///
      /// Parent Type: `UserType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("userId", String?.self),
          .field("userToken", String?.self),
          .field("user", User?.self),
        ] }

        public var userId: String? { __data["userId"] }
        public var userToken: String? { __data["userToken"] }
        public var user: User? { __data["user"] }

        /// CreateUser.Result.User
        ///
        /// Parent Type: `UserEditProfile`
        public struct User: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserEditProfile }
          public static var __selections: [Apollo.Selection] { [
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

          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var gender: String? { __data["gender"] }
          public var dateOfBirth: String? { __data["dateOfBirth"] }
          public var phoneNumber: String? { __data["phoneNumber"] }
          public var preferredLanguage: String? { __data["preferredLanguage"] }
          public var preferredCurrency: String? { __data["preferredCurrency"] }
          public var createdAt: String? { __data["createdAt"] }
          public var picture: String? { __data["picture"] }
          public var verification: Verification? { __data["verification"] }
          public var userData: UserData? { __data["userData"] }

          /// CreateUser.Result.User.Verification
          ///
          /// Parent Type: `UserVerifiedInfo`
          public struct Verification: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserVerifiedInfo }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("isPhoneVerified", Bool?.self),
              .field("isEmailConfirmed", Bool?.self),
              .field("isIdVerification", Bool?.self),
              .field("isGoogleConnected", Bool?.self),
              .field("isFacebookConnected", Bool?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
            public var isEmailConfirmed: Bool? { __data["isEmailConfirmed"] }
            public var isIdVerification: Bool? { __data["isIdVerification"] }
            public var isGoogleConnected: Bool? { __data["isGoogleConnected"] }
            public var isFacebookConnected: Bool? { __data["isFacebookConnected"] }
          }

          /// CreateUser.Result.User.UserData
          ///
          /// Parent Type: `UserProfile`
          public struct UserData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
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
}
