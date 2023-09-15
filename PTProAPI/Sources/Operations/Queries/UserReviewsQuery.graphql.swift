// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserReviewsQuery: GraphQLQuery {
  public static let operationName: String = "userReviews"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query userReviews($ownerType: String, $currentPage: Int, $profileId: Int) {
        userReviews(
          ownerType: $ownerType
          currentPage: $currentPage
          profileId: $profileId
        ) {
          __typename
          results {
            __typename
            id
            reservationId
            listId
            authorId
            userId
            reviewContent
            rating
            parentId
            automated
            createdAt
            status
            isAdmin
            yourReviewsCount
            reviewsCount
            authorData {
              __typename
              ...profileFields
            }
            userData {
              __typename
              ...profileFields
            }
            response {
              __typename
              id
              reservationId
              listId
              authorId
              userId
              reviewContent
              rating
              parentId
              automated
              createdAt
              status
              isAdmin
              authorData {
                __typename
                ...profileFields
              }
              userData {
                __typename
                ...profileFields
              }
            }
          }
          status
          errorMessage
        }
      }
      """,
      fragments: [ProfileFields.self]
    ))

  public var ownerType: GraphQLNullable<String>
  public var currentPage: GraphQLNullable<Int>
  public var profileId: GraphQLNullable<Int>

  public init(
    ownerType: GraphQLNullable<String>,
    currentPage: GraphQLNullable<Int>,
    profileId: GraphQLNullable<Int>
  ) {
    self.ownerType = ownerType
    self.currentPage = currentPage
    self.profileId = profileId
  }

  public var __variables: Variables? { [
    "ownerType": ownerType,
    "currentPage": currentPage,
    "profileId": profileId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("userReviews", UserReviews?.self, arguments: [
        "ownerType": .variable("ownerType"),
        "currentPage": .variable("currentPage"),
        "profileId": .variable("profileId")
      ]),
    ] }

    public var userReviews: UserReviews? { __data["userReviews"] }

    /// UserReviews
    ///
    /// Parent Type: `Reviewlist`
    public struct UserReviews: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.Reviewlist }
      public static var __selections: [Selection] { [
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// UserReviews.Result
      ///
      /// Parent Type: `Reviews`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.Reviews }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("reservationId", Int?.self),
          .field("listId", Int?.self),
          .field("authorId", String?.self),
          .field("userId", String?.self),
          .field("reviewContent", String?.self),
          .field("rating", Double?.self),
          .field("parentId", Int?.self),
          .field("automated", Bool?.self),
          .field("createdAt", String?.self),
          .field("status", String?.self),
          .field("isAdmin", Bool?.self),
          .field("yourReviewsCount", Int?.self),
          .field("reviewsCount", Int?.self),
          .field("authorData", AuthorData?.self),
          .field("userData", UserData?.self),
          .field("response", Response?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var reservationId: Int? { __data["reservationId"] }
        public var listId: Int? { __data["listId"] }
        public var authorId: String? { __data["authorId"] }
        public var userId: String? { __data["userId"] }
        public var reviewContent: String? { __data["reviewContent"] }
        public var rating: Double? { __data["rating"] }
        public var parentId: Int? { __data["parentId"] }
        public var automated: Bool? { __data["automated"] }
        public var createdAt: String? { __data["createdAt"] }
        public var status: String? { __data["status"] }
        public var isAdmin: Bool? { __data["isAdmin"] }
        public var yourReviewsCount: Int? { __data["yourReviewsCount"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var authorData: AuthorData? { __data["authorData"] }
        public var userData: UserData? { __data["userData"] }
        public var response: Response? { __data["response"] }

        /// UserReviews.Result.AuthorData
        ///
        /// Parent Type: `UserProfile`
        public struct AuthorData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .fragment(ProfileFields.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var picture: String? { __data["picture"] }
          public var location: String? { __data["location"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var profileFields: ProfileFields { _toFragment() }
          }
        }

        /// UserReviews.Result.UserData
        ///
        /// Parent Type: `UserProfile`
        public struct UserData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .fragment(ProfileFields.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var picture: String? { __data["picture"] }
          public var location: String? { __data["location"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var profileFields: ProfileFields { _toFragment() }
          }
        }

        /// UserReviews.Result.Response
        ///
        /// Parent Type: `ReviewResponse`
        public struct Response: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.ReviewResponse }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("reservationId", Int?.self),
            .field("listId", Int?.self),
            .field("authorId", String?.self),
            .field("userId", String?.self),
            .field("reviewContent", String?.self),
            .field("rating", Double?.self),
            .field("parentId", Int?.self),
            .field("automated", Bool?.self),
            .field("createdAt", String?.self),
            .field("status", String?.self),
            .field("isAdmin", Bool?.self),
            .field("authorData", AuthorData?.self),
            .field("userData", UserData?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var reservationId: Int? { __data["reservationId"] }
          public var listId: Int? { __data["listId"] }
          public var authorId: String? { __data["authorId"] }
          public var userId: String? { __data["userId"] }
          public var reviewContent: String? { __data["reviewContent"] }
          public var rating: Double? { __data["rating"] }
          public var parentId: Int? { __data["parentId"] }
          public var automated: Bool? { __data["automated"] }
          public var createdAt: String? { __data["createdAt"] }
          public var status: String? { __data["status"] }
          public var isAdmin: Bool? { __data["isAdmin"] }
          public var authorData: AuthorData? { __data["authorData"] }
          public var userData: UserData? { __data["userData"] }

          /// UserReviews.Result.Response.AuthorData
          ///
          /// Parent Type: `UserProfile`
          public struct AuthorData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
            public static var __selections: [Selection] { [
              .fragment(ProfileFields.self),
            ] }

            public var profileId: Int? { __data["profileId"] }
            public var firstName: String? { __data["firstName"] }
            public var lastName: String? { __data["lastName"] }
            public var picture: String? { __data["picture"] }
            public var location: String? { __data["location"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public var profileFields: ProfileFields { _toFragment() }
            }
          }

          /// UserReviews.Result.Response.UserData
          ///
          /// Parent Type: `UserProfile`
          public struct UserData: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
            public static var __selections: [Selection] { [
              .fragment(ProfileFields.self),
            ] }

            public var profileId: Int? { __data["profileId"] }
            public var firstName: String? { __data["firstName"] }
            public var lastName: String? { __data["lastName"] }
            public var picture: String? { __data["picture"] }
            public var location: String? { __data["location"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public var profileFields: ProfileFields { _toFragment() }
            }
          }
        }
      }
    }
  }
}
