// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetReviewsListQuery: GraphQLQuery {
  public static let operationName: String = "getReviewsList"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getReviewsList($listId: Int, $currentPage: Int, $hostId: String!) { getReviews(listId: $listId, currentPage: $currentPage, hostId: $hostId) { __typename results { __typename id userId reviewContent rating createdAt isAdmin userData { __typename userId profileId firstName lastName picture } authorData { __typename userId profileId firstName lastName picture } } status count } }"#
    ))

  public var listId: GraphQLNullable<Int>
  public var currentPage: GraphQLNullable<Int>
  public var hostId: String

  public init(
    listId: GraphQLNullable<Int>,
    currentPage: GraphQLNullable<Int>,
    hostId: String
  ) {
    self.listId = listId
    self.currentPage = currentPage
    self.hostId = hostId
  }

  public var __variables: Variables? { [
    "listId": listId,
    "currentPage": currentPage,
    "hostId": hostId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getReviews", GetReviews?.self, arguments: [
        "listId": .variable("listId"),
        "currentPage": .variable("currentPage"),
        "hostId": .variable("hostId")
      ]),
    ] }

    public var getReviews: GetReviews? { __data["getReviews"] }

    /// GetReviews
    ///
    /// Parent Type: `AllReview`
    public struct GetReviews: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllReview }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("count", Int?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var count: Int? { __data["count"] }

      /// GetReviews.Result
      ///
      /// Parent Type: `Reviews`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviews }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("userId", String?.self),
          .field("reviewContent", String?.self),
          .field("rating", Double?.self),
          .field("createdAt", String?.self),
          .field("isAdmin", Bool?.self),
          .field("userData", UserData?.self),
          .field("authorData", AuthorData?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var userId: String? { __data["userId"] }
        public var reviewContent: String? { __data["reviewContent"] }
        public var rating: Double? { __data["rating"] }
        public var createdAt: String? { __data["createdAt"] }
        public var isAdmin: Bool? { __data["isAdmin"] }
        public var userData: UserData? { __data["userData"] }
        public var authorData: AuthorData? { __data["authorData"] }

        /// GetReviews.Result.UserData
        ///
        /// Parent Type: `UserProfile`
        public struct UserData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("firstName", String?.self),
            .field("lastName", String?.self),
            .field("picture", String?.self),
          ] }

          public var userId: String? { __data["userId"] }
          public var profileId: Int? { __data["profileId"] }
          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var picture: String? { __data["picture"] }
        }

        /// GetReviews.Result.AuthorData
        ///
        /// Parent Type: `UserProfile`
        public struct AuthorData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("firstName", String?.self),
            .field("lastName", String?.self),
            .field("picture", String?.self),
          ] }

          public var userId: String? { __data["userId"] }
          public var profileId: Int? { __data["profileId"] }
          public var firstName: String? { __data["firstName"] }
          public var lastName: String? { __data["lastName"] }
          public var picture: String? { __data["picture"] }
        }
      }
    }
  }
}