// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ResendConfirmEmailQuery: GraphQLQuery {
  public static let operationName: String = "ResendConfirmEmail"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query ResendConfirmEmail {
        ResendConfirmEmail {
          __typename
          results {
            __typename
            id
            userId
            profile {
              __typename
              firstName
              userData {
                __typename
                email
              }
            }
            token
            email
            status
          }
          status
          errorMessage
        }
      }
      """
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("ResendConfirmEmail", ResendConfirmEmail?.self),
    ] }

    public var resendConfirmEmail: ResendConfirmEmail? { __data["ResendConfirmEmail"] }

    /// ResendConfirmEmail
    ///
    /// Parent Type: `AllEmailToken`
    public struct ResendConfirmEmail: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllEmailToken }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ResendConfirmEmail.Results
      ///
      /// Parent Type: `EmailToken`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.EmailToken }
        public static var __selections: [Selection] { [
          .field("id", String?.self),
          .field("userId", String?.self),
          .field("profile", Profile?.self),
          .field("token", String?.self),
          .field("email", String?.self),
          .field("status", String?.self),
        ] }

        public var id: String? { __data["id"] }
        public var userId: String? { __data["userId"] }
        public var profile: Profile? { __data["profile"] }
        public var token: String? { __data["token"] }
        public var email: String? { __data["email"] }
        public var status: String? { __data["status"] }

        /// ResendConfirmEmail.Results.Profile
        ///
        /// Parent Type: `UserProfile`
        public struct Profile: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .field("firstName", String?.self),
            .field("userData", UserData?.self),
          ] }

          public var firstName: String? { __data["firstName"] }
          public var userData: UserData? { __data["userData"] }

          /// ResendConfirmEmail.Results.Profile.UserData
          ///
          /// Parent Type: `UserType`
          public struct UserData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PTProAPI.Objects.UserType }
            public static var __selections: [Selection] { [
              .field("email", String?.self),
            ] }

            public var email: String? { __data["email"] }
          }
        }
      }
    }
  }
}
