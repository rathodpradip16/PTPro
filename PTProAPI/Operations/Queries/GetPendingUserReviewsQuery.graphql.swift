// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPendingUserReviewsQuery: GraphQLQuery {
    static let operationName: String = "getPendingUserReviews"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPendingUserReviews($currentPage: Int) { getPendingUserReviews(currentPage: $currentPage) { __typename status errorMessage count currentPage results { __typename id listId listData { __typename id title listPhotos { __typename id name } } listingData { __typename title } hostId guestId hostData { __typename userId profileId firstName lastName picture } guestData { __typename userId profileId firstName lastName picture } } } }"#
      ))

    public var currentPage: GraphQLNullable<Int>

    public init(currentPage: GraphQLNullable<Int>) {
      self.currentPage = currentPage
    }

    public var __variables: Variables? { ["currentPage": currentPage] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPendingUserReviews", GetPendingUserReviews?.self, arguments: ["currentPage": .variable("currentPage")]),
      ] }

      var getPendingUserReviews: GetPendingUserReviews? { __data["getPendingUserReviews"] }

      /// GetPendingUserReviews
      ///
      /// Parent Type: `AllReservation`
      struct GetPendingUserReviews: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllReservation }
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

        /// GetPendingUserReviews.Result
        ///
        /// Parent Type: `Reservation`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("listData", ListData?.self),
            .field("listingData", ListingData?.self),
            .field("hostId", String?.self),
            .field("guestId", String?.self),
            .field("hostData", HostData?.self),
            .field("guestData", GuestData?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var listData: ListData? { __data["listData"] }
          var listingData: ListingData? { __data["listingData"] }
          var hostId: String? { __data["hostId"] }
          var guestId: String? { __data["guestId"] }
          var hostData: HostData? { __data["hostData"] }
          var guestData: GuestData? { __data["guestData"] }

          /// GetPendingUserReviews.Result.ListData
          ///
          /// Parent Type: `ShowListing`
          struct ListData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("title", String?.self),
              .field("listPhotos", [ListPhoto?]?.self),
            ] }

            var id: Int? { __data["id"] }
            var title: String? { __data["title"] }
            var listPhotos: [ListPhoto?]? { __data["listPhotos"] }

            /// GetPendingUserReviews.Result.ListData.ListPhoto
            ///
            /// Parent Type: `ListPhotosData`
            struct ListPhoto: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosData }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", Int?.self),
                .field("name", String?.self),
              ] }

              var id: Int? { __data["id"] }
              var name: String? { __data["name"] }
            }
          }

          /// GetPendingUserReviews.Result.ListingData
          ///
          /// Parent Type: `ShowListing`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("title", String?.self),
            ] }

            var title: String? { __data["title"] }
          }

          /// GetPendingUserReviews.Result.HostData
          ///
          /// Parent Type: `UserProfile`
          struct HostData: PTProAPI.SelectionSet {
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

          /// GetPendingUserReviews.Result.GuestData
          ///
          /// Parent Type: `UserProfile`
          struct GuestData: PTProAPI.SelectionSet {
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