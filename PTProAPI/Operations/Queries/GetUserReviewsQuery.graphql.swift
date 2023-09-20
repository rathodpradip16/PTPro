// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetUserReviewsQuery: GraphQLQuery {
    static let operationName: String = "getUserReviews"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getUserReviews", GetUserReviews?.self, arguments: [
          "currentPage": .variable("currentPage"),
          "ownerType": .variable("ownerType")
        ]),
      ] }

      var getUserReviews: GetUserReviews? { __data["getUserReviews"] }

      /// GetUserReviews
      ///
      /// Parent Type: `Reviewlist`
      struct GetUserReviews: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviewlist }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("count", Int?.self),
          .field("ownerType", String?.self),
          .field("currentPage", Int?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var count: Int? { __data["count"] }
        var ownerType: String? { __data["ownerType"] }
        var currentPage: Int? { __data["currentPage"] }
        var results: [Result?]? { __data["results"] }

        /// GetUserReviews.Result
        ///
        /// Parent Type: `Reviews`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviews }
          static var __selections: [Apollo.Selection] { [
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

          var id: Int? { __data["id"] }
          var reservationId: Int? { __data["reservationId"] }
          var listId: Int? { __data["listId"] }
          var listData: ListData? { __data["listData"] }
          var authorId: String? { __data["authorId"] }
          var userId: String? { __data["userId"] }
          var reviewContent: String? { __data["reviewContent"] }
          var rating: Double? { __data["rating"] }
          var createdAt: String? { __data["createdAt"] }
          var isAdmin: Bool? { __data["isAdmin"] }
          var authorData: AuthorData? { __data["authorData"] }
          var userData: UserData? { __data["userData"] }

          /// GetUserReviews.Result.ListData
          ///
          /// Parent Type: `AdminListing`
          struct ListData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AdminListing }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("title", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var title: String? { __data["title"] }
          }

          /// GetUserReviews.Result.AuthorData
          ///
          /// Parent Type: `UserProfile`
          struct AuthorData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .fragment(ProfileFields.self),
            ] }

            var profileId: Int? { __data["profileId"] }
            var firstName: String? { __data["firstName"] }
            var lastName: String? { __data["lastName"] }
            var picture: String? { __data["picture"] }
            var location: String? { __data["location"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var profileFields: ProfileFields { _toFragment() }
            }
          }

          /// GetUserReviews.Result.UserData
          ///
          /// Parent Type: `UserProfile`
          struct UserData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .fragment(ProfileFields.self),
            ] }

            var profileId: Int? { __data["profileId"] }
            var firstName: String? { __data["firstName"] }
            var lastName: String? { __data["lastName"] }
            var picture: String? { __data["picture"] }
            var location: String? { __data["location"] }

            struct Fragments: FragmentContainer {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              var profileFields: ProfileFields { _toFragment() }
            }
          }
        }
      }
    }
  }

}