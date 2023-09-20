// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UserReviewsQuery: GraphQLQuery {
    static let operationName: String = "userReviews"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query userReviews($ownerType: String, $currentPage: Int, $profileId: Int) { userReviews( ownerType: $ownerType currentPage: $currentPage profileId: $profileId ) { __typename results { __typename id reservationId listId authorId userId reviewContent rating parentId automated createdAt status isAdmin yourReviewsCount reviewsCount authorData { __typename ...profileFields } userData { __typename ...profileFields } response { __typename id reservationId listId authorId userId reviewContent rating parentId automated createdAt status isAdmin authorData { __typename ...profileFields } userData { __typename ...profileFields } } } status errorMessage } }"#,
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("userReviews", UserReviews?.self, arguments: [
          "ownerType": .variable("ownerType"),
          "currentPage": .variable("currentPage"),
          "profileId": .variable("profileId")
        ]),
      ] }

      var userReviews: UserReviews? { __data["userReviews"] }

      /// UserReviews
      ///
      /// Parent Type: `Reviewlist`
      struct UserReviews: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviewlist }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// UserReviews.Result
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

          var id: Int? { __data["id"] }
          var reservationId: Int? { __data["reservationId"] }
          var listId: Int? { __data["listId"] }
          var authorId: String? { __data["authorId"] }
          var userId: String? { __data["userId"] }
          var reviewContent: String? { __data["reviewContent"] }
          var rating: Double? { __data["rating"] }
          var parentId: Int? { __data["parentId"] }
          var automated: Bool? { __data["automated"] }
          var createdAt: String? { __data["createdAt"] }
          var status: String? { __data["status"] }
          var isAdmin: Bool? { __data["isAdmin"] }
          var yourReviewsCount: Int? { __data["yourReviewsCount"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var authorData: AuthorData? { __data["authorData"] }
          var userData: UserData? { __data["userData"] }
          var response: Response? { __data["response"] }

          /// UserReviews.Result.AuthorData
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

          /// UserReviews.Result.UserData
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

          /// UserReviews.Result.Response
          ///
          /// Parent Type: `ReviewResponse`
          struct Response: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReviewResponse }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
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

            var id: Int? { __data["id"] }
            var reservationId: Int? { __data["reservationId"] }
            var listId: Int? { __data["listId"] }
            var authorId: String? { __data["authorId"] }
            var userId: String? { __data["userId"] }
            var reviewContent: String? { __data["reviewContent"] }
            var rating: Double? { __data["rating"] }
            var parentId: Int? { __data["parentId"] }
            var automated: Bool? { __data["automated"] }
            var createdAt: String? { __data["createdAt"] }
            var status: String? { __data["status"] }
            var isAdmin: Bool? { __data["isAdmin"] }
            var authorData: AuthorData? { __data["authorData"] }
            var userData: UserData? { __data["userData"] }

            /// UserReviews.Result.Response.AuthorData
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

            /// UserReviews.Result.Response.UserData
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

}