// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPendingUserReviewQuery: GraphQLQuery {
  public static let operationName: String = "getPendingUserReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getPendingUserReview($reservationId: Int!) { getPendingUserReview(reservationId: $reservationId) { __typename status errorMessage result { __typename id listId guestId hostId listData { __typename id title city state country roomType reviewsCount reviewsStarRating coverPhoto listPhotoName listPhotos { __typename id name } } } } }"#
    ))

  public var reservationId: Int

  public init(reservationId: Int) {
    self.reservationId = reservationId
  }

  public var __variables: Variables? { ["reservationId": reservationId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getPendingUserReview", GetPendingUserReview?.self, arguments: ["reservationId": .variable("reservationId")]),
    ] }

    public var getPendingUserReview: GetPendingUserReview? { __data["getPendingUserReview"] }

    /// GetPendingUserReview
    ///
    /// Parent Type: `CommonReservationType`
    public struct GetPendingUserReview: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.CommonReservationType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("result", Result?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var result: Result? { __data["result"] }

      /// GetPendingUserReview.Result
      ///
      /// Parent Type: `Reservation`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Reservation }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("listId", Int?.self),
          .field("guestId", String?.self),
          .field("hostId", String?.self),
          .field("listData", ListData?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var guestId: String? { __data["guestId"] }
        public var hostId: String? { __data["hostId"] }
        public var listData: ListData? { __data["listData"] }

        /// GetPendingUserReview.Result.ListData
        ///
        /// Parent Type: `ShowListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [ApolloAPI.Selection] { [
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

          public var id: Int? { __data["id"] }
          public var title: String? { __data["title"] }
          public var city: String? { __data["city"] }
          public var state: String? { __data["state"] }
          public var country: String? { __data["country"] }
          public var roomType: String? { __data["roomType"] }
          public var reviewsCount: Int? { __data["reviewsCount"] }
          public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          public var coverPhoto: Int? { __data["coverPhoto"] }
          public var listPhotoName: String? { __data["listPhotoName"] }
          public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }

          /// GetPendingUserReview.Result.ListData.ListPhoto
          ///
          /// Parent Type: `ListPhotosData`
          public struct ListPhoto: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotosData }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("name", String?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var name: String? { __data["name"] }
          }
        }
      }
    }
  }
}
