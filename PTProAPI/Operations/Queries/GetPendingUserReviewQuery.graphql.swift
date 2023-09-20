// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPendingUserReviewQuery: GraphQLQuery {
    static let operationName: String = "getPendingUserReview"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPendingUserReview($reservationId: Int!) { getPendingUserReview(reservationId: $reservationId) { __typename status errorMessage result { __typename id listId guestId hostId listData { __typename id title city state country roomType reviewsCount reviewsStarRating coverPhoto listPhotoName listPhotos { __typename id name } } } } }"#
      ))

    public var reservationId: Int

    public init(reservationId: Int) {
      self.reservationId = reservationId
    }

    public var __variables: Variables? { ["reservationId": reservationId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPendingUserReview", GetPendingUserReview?.self, arguments: ["reservationId": .variable("reservationId")]),
      ] }

      var getPendingUserReview: GetPendingUserReview? { __data["getPendingUserReview"] }

      /// GetPendingUserReview
      ///
      /// Parent Type: `CommonReservationType`
      struct GetPendingUserReview: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CommonReservationType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("result", Result?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var result: Result? { __data["result"] }

        /// GetPendingUserReview.Result
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
            .field("guestId", String?.self),
            .field("hostId", String?.self),
            .field("listData", ListData?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var guestId: String? { __data["guestId"] }
          var hostId: String? { __data["hostId"] }
          var listData: ListData? { __data["listData"] }

          /// GetPendingUserReview.Result.ListData
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
              .field("city", String?.self),
              .field("state", String?.self),
              .field("country", String?.self),
              .field("roomType", String?.self),
              .field("reviewsCount", Int?.self),
              .field("reviewsStarRating", Int?.self),
              .field("coverPhoto", Int?.self),
              .field("listPhotoName", String?.self),
              .field("listPhotos", [ListPhoto?]?.self),
            ] }

            var id: Int? { __data["id"] }
            var title: String? { __data["title"] }
            var city: String? { __data["city"] }
            var state: String? { __data["state"] }
            var country: String? { __data["country"] }
            var roomType: String? { __data["roomType"] }
            var reviewsCount: Int? { __data["reviewsCount"] }
            var reviewsStarRating: Int? { __data["reviewsStarRating"] }
            var coverPhoto: Int? { __data["coverPhoto"] }
            var listPhotoName: String? { __data["listPhotoName"] }
            var listPhotos: [ListPhoto?]? { __data["listPhotos"] }

            /// GetPendingUserReview.Result.ListData.ListPhoto
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
        }
      }
    }
  }

}