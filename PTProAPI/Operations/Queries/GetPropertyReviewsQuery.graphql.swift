// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPropertyReviewsQuery: GraphQLQuery {
    static let operationName: String = "getPropertyReviews"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPropertyReviews", GetPropertyReviews?.self, arguments: [
          "currentPage": .variable("currentPage"),
          "listId": .variable("listId")
        ]),
      ] }

      var getPropertyReviews: GetPropertyReviews? { __data["getPropertyReviews"] }

      /// GetPropertyReviews
      ///
      /// Parent Type: `Reviewlist`
      struct GetPropertyReviews: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reviewlist }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("count", Int?.self),
          .field("currentPage", Int?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var count: Int? { __data["count"] }
        var currentPage: Int? { __data["currentPage"] }
        var results: [Result?]? { __data["results"] }

        /// GetPropertyReviews.Result
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
            .field("createdAt", String?.self),
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
          var createdAt: String? { __data["createdAt"] }
          var isAdmin: Bool? { __data["isAdmin"] }
          var authorData: AuthorData? { __data["authorData"] }
          var userData: UserData? { __data["userData"] }

          /// GetPropertyReviews.Result.AuthorData
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

          /// GetPropertyReviews.Result.UserData
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