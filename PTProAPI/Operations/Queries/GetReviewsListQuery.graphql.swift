// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetReviewsListQuery: GraphQLQuery {
    static let operationName: String = "getReviewsList"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getReviews", GetReviews?.self, arguments: [
          "listId": .variable("listId"),
          "currentPage": .variable("currentPage"),
          "hostId": .variable("hostId")
        ]),
      ] }

      var getReviews: GetReviews? { __data["getReviews"] }

      /// GetReviews
      ///
      /// Parent Type: `AllReview`
      struct GetReviews: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllReview }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("count", Int?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var count: Int? { __data["count"] }

        /// GetReviews.Result
        ///
        /// Parent Type: `Reviews`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviews }
          static var __selections: [Apollo.Selection] { [
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

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var reviewContent: String? { __data["reviewContent"] }
          var rating: Double? { __data["rating"] }
          var createdAt: String? { __data["createdAt"] }
          var isAdmin: Bool? { __data["isAdmin"] }
          var userData: UserData? { __data["userData"] }
          var authorData: AuthorData? { __data["authorData"] }

          /// GetReviews.Result.UserData
          ///
          /// Parent Type: `UserProfile`
          struct UserData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userId", String?.self),
              .field("profileId", Int?.self),
              .field("firstName", String?.self),
              .field("lastName", String?.self),
              .field("picture", String?.self),
            ] }

            var userId: String? { __data["userId"] }
            var profileId: Int? { __data["profileId"] }
            var firstName: String? { __data["firstName"] }
            var lastName: String? { __data["lastName"] }
            var picture: String? { __data["picture"] }
          }

          /// GetReviews.Result.AuthorData
          ///
          /// Parent Type: `UserProfile`
          struct AuthorData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userId", String?.self),
              .field("profileId", Int?.self),
              .field("firstName", String?.self),
              .field("lastName", String?.self),
              .field("picture", String?.self),
            ] }

            var userId: String? { __data["userId"] }
            var profileId: Int? { __data["profileId"] }
            var firstName: String? { __data["firstName"] }
            var lastName: String? { __data["lastName"] }
            var picture: String? { __data["picture"] }
          }
        }
      }
    }
  }

}