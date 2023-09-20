// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetPendingUserReviewsQuery: GraphQLQuery {
  public static let operationName: String = "getPendingUserReviews"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getPendingUserReviews($currentPage: Int) { getPendingUserReviews(currentPage: $currentPage) { __typename status errorMessage count currentPage results { __typename id listId listData { __typename id title listPhotos { __typename id name } } listingData { __typename title } hostId guestId hostData { __typename userId profileId firstName lastName picture } guestData { __typename userId profileId firstName lastName picture } } } }"#
    ))

  public var currentPage: GraphQLNullable<Int>

  public init(currentPage: GraphQLNullable<Int>) {
    self.currentPage = currentPage
  }

  public var __variables: Variables? { ["currentPage": currentPage] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getPendingUserReviews", GetPendingUserReviews?.self, arguments: ["currentPage": .variable("currentPage")]),
    ] }

    public var getPendingUserReviews: GetPendingUserReviews? { __data["getPendingUserReviews"] }

    /// GetPendingUserReviews
    ///
    /// Parent Type: `AllReservation`
    public struct GetPendingUserReviews: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllReservation }
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

      /// GetPendingUserReviews.Result
      ///
      /// Parent Type: `Reservation`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
        public static var __selections: [Apollo.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var listData: ListData? { __data["listData"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var hostId: String? { __data["hostId"] }
        public var guestId: String? { __data["guestId"] }
        public var hostData: HostData? { __data["hostData"] }
        public var guestData: GuestData? { __data["guestData"] }

        /// GetPendingUserReviews.Result.ListData
        ///
        /// Parent Type: `ShowListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("listPhotos", [ListPhoto?]?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var title: String? { __data["title"] }
          public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }

          /// GetPendingUserReviews.Result.ListData.ListPhoto
          ///
          /// Parent Type: `ListPhotosData`
          public struct ListPhoto: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosData }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("name", String?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var name: String? { __data["name"] }
          }
        }

        /// GetPendingUserReviews.Result.ListingData
        ///
        /// Parent Type: `ShowListing`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("title", String?.self),
          ] }

          public var title: String? { __data["title"] }
        }

        /// GetPendingUserReviews.Result.HostData
        ///
        /// Parent Type: `UserProfile`
        public struct HostData: PTProAPI.SelectionSet {
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

        /// GetPendingUserReviews.Result.GuestData
        ///
        /// Parent Type: `UserProfile`
        public struct GuestData: PTProAPI.SelectionSet {
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
