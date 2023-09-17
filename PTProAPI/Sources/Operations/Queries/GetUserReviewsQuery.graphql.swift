// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetUserReviewsQuery: GraphQLQuery {
  public static let operationName: String = "getUserReviews"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getUserReviews($currentPage: Int, $ownerType: String) { getUserReviews(currentPage: $currentPage, ownerType: $ownerType) { __typename status errorMessage count ownerType currentPage results { __typename id reservationId listId listData { __typename id title } authorId userId reviewContent rating createdAt isAdmin authorData { __typename ...profileFields } userData { __typename ...profileFields } } } }"#,
      fragments: [ProfileFields.self]
    ))

  public var currentPage: GraphQLNullable<Int>
  public var ownerType: GraphQLNullable<String>

  public init(
    currentPage: GraphQLNullable<Int>,
    ownerType: GraphQLNullable<String>
  ) {
    self.currentPage = currentPage
    self.ownerType = ownerType
  }

  public var __variables: Variables? { [
    "currentPage": currentPage,
    "ownerType": ownerType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getUserReviews", GetUserReviews?.self, arguments: [
        "currentPage": .variable("currentPage"),
        "ownerType": .variable("ownerType")
      ]),
    ] }

    public var getUserReviews: GetUserReviews? { __data["getUserReviews"] }

    /// GetUserReviews
    ///
    /// Parent Type: `Reviewlist`
    public struct GetUserReviews: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Reviewlist }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("count", Int?.self),
        .field("ownerType", String?.self),
        .field("currentPage", Int?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var count: Int? { __data["count"] }
      public var ownerType: String? { __data["ownerType"] }
      public var currentPage: Int? { __data["currentPage"] }
      public var results: [Result?]? { __data["results"] }

      /// GetUserReviews.Result
      ///
      /// Parent Type: `Reviews`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Reviews }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("reservationId", Int?.self),
          .field("listId", Int?.self),
          .field("listData", ListData?.self),
          .field("authorId", String?.self),
          .field("userId", String?.self),
          .field("reviewContent", String?.self),
          .field("rating", Double?.self),
          .field("createdAt", String?.self),
          .field("isAdmin", Bool?.self),
          .field("authorData", AuthorData?.self),
          .field("userData", UserData?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var reservationId: Int? { __data["reservationId"] }
        public var listId: Int? { __data["listId"] }
        public var listData: ListData? { __data["listData"] }
        public var authorId: String? { __data["authorId"] }
        public var userId: String? { __data["userId"] }
        public var reviewContent: String? { __data["reviewContent"] }
        public var rating: Double? { __data["rating"] }
        public var createdAt: String? { __data["createdAt"] }
        public var isAdmin: Bool? { __data["isAdmin"] }
        public var authorData: AuthorData? { __data["authorData"] }
        public var userData: UserData? { __data["userData"] }

        /// GetUserReviews.Result.ListData
        ///
        /// Parent Type: `AdminListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AdminListing }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var title: String? { __data["title"] }
        }

        /// GetUserReviews.Result.AuthorData
        ///
        /// Parent Type: `UserProfile`
        public struct AuthorData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ProfileFields.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var picture: String? { __data["picture"] }
          public var location: String? { __data["location"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var profileFields: ProfileFields { _toFragment() }
          }
        }

        /// GetUserReviews.Result.UserData
        ///
        /// Parent Type: `UserProfile`
        public struct UserData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ProfileFields.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var picture: String? { __data["picture"] }
          public var location: String? { __data["location"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var profileFields: ProfileFields { _toFragment() }
          }
        }
      }
    }
  }
}
