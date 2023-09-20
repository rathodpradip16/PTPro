// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetPropertyReviewsQuery: GraphQLQuery {
  public static let operationName: String = "getPropertyReviews"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getPropertyReviews($currentPage: Int!, $listId: Int!) { getPropertyReviews(currentPage: $currentPage, listId: $listId) { __typename status errorMessage count currentPage results { __typename id reservationId listId authorId userId reviewContent rating createdAt isAdmin authorData { __typename ...profileFields } userData { __typename ...profileFields } } } }"#,
      fragments: [ProfileFields.self]
    ))

  public var currentPage: Int
  public var listId: Int

  public init(
    currentPage: Int,
    listId: Int
  ) {
    self.currentPage = currentPage
    self.listId = listId
  }

  public var __variables: Variables? { [
    "currentPage": currentPage,
    "listId": listId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getPropertyReviews", GetPropertyReviews?.self, arguments: [
        "currentPage": .variable("currentPage"),
        "listId": .variable("listId")
      ]),
    ] }

    public var getPropertyReviews: GetPropertyReviews? { __data["getPropertyReviews"] }

    /// GetPropertyReviews
    ///
    /// Parent Type: `Reviewlist`
    public struct GetPropertyReviews: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviewlist }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("count", Int?.self),
        .field("currentPage", Int?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var count: Int? { __data["count"] }
      public var currentPage: Int? { __data["currentPage"] }
      public var results: [Result?]? { __data["results"] }

      /// GetPropertyReviews.Result
      ///
      /// Parent Type: `Reviews`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviews }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("reservationId", Int?.self),
          .field("listId", Int?.self),
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
        public var authorId: String? { __data["authorId"] }
        public var userId: String? { __data["userId"] }
        public var reviewContent: String? { __data["reviewContent"] }
        public var rating: Double? { __data["rating"] }
        public var createdAt: String? { __data["createdAt"] }
        public var isAdmin: Bool? { __data["isAdmin"] }
        public var authorData: AuthorData? { __data["authorData"] }
        public var userData: UserData? { __data["userData"] }

        /// GetPropertyReviews.Result.AuthorData
        ///
        /// Parent Type: `UserProfile`
        public struct AuthorData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Apollo.Selection] { [
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

        /// GetPropertyReviews.Result.UserData
        ///
        /// Parent Type: `UserProfile`
        public struct UserData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Apollo.Selection] { [
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
