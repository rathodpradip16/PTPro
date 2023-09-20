// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetAllWishListGroupQuery: GraphQLQuery {
  public static let operationName: String = "getAllWishListGroup"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getAllWishListGroup($currentPage: Int) { getAllWishListGroup(currentPage: $currentPage) { __typename status count errorMessage results { __typename id name userId isPublic updatedAt wishListIds wishListCount wishListCover { __typename id listId listData { __typename id title personCapacity beds bookingType coverPhoto reviewsCount reviewsStarRating wishListStatus listPhotoName listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } } } } } }"#
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
      .field("getAllWishListGroup", GetAllWishListGroup?.self, arguments: ["currentPage": .variable("currentPage")]),
    ] }

    public var getAllWishListGroup: GetAllWishListGroup? { __data["getAllWishListGroup"] }

    /// GetAllWishListGroup
    ///
    /// Parent Type: `AllWishListGroup`
    public struct GetAllWishListGroup: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllWishListGroup }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("count", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var count: Int? { __data["count"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: [Result?]? { __data["results"] }

      /// GetAllWishListGroup.Result
      ///
      /// Parent Type: `WishListGroup`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishListGroup }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("name", String?.self),
          .field("userId", PTProAPI.ID.self),
          .field("isPublic", String?.self),
          .field("updatedAt", String?.self),
          .field("wishListIds", [Int?]?.self),
          .field("wishListCount", Int?.self),
          .field("wishListCover", WishListCover?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var name: String? { __data["name"] }
        public var userId: PTProAPI.ID { __data["userId"] }
        public var isPublic: String? { __data["isPublic"] }
        public var updatedAt: String? { __data["updatedAt"] }
        public var wishListIds: [Int?]? { __data["wishListIds"] }
        public var wishListCount: Int? { __data["wishListCount"] }
        public var wishListCover: WishListCover? { __data["wishListCover"] }

        /// GetAllWishListGroup.Result.WishListCover
        ///
        /// Parent Type: `WishList`
        public struct WishListCover: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishList }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("listData", ListData?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var listId: Int? { __data["listId"] }
          public var listData: ListData? { __data["listData"] }

          /// GetAllWishListGroup.Result.WishListCover.ListData
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
              .field("personCapacity", Int?.self),
              .field("beds", Int?.self),
              .field("bookingType", String?.self),
              .field("coverPhoto", Int?.self),
              .field("reviewsCount", Int?.self),
              .field("reviewsStarRating", Int?.self),
              .field("wishListStatus", Bool?.self),
              .field("listPhotoName", String?.self),
              .field("listPhotos", [ListPhoto?]?.self),
              .field("listingData", ListingData?.self),
              .field("settingsData", [SettingsDatum?]?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var title: String? { __data["title"] }
            public var personCapacity: Int? { __data["personCapacity"] }
            public var beds: Int? { __data["beds"] }
            public var bookingType: String? { __data["bookingType"] }
            public var coverPhoto: Int? { __data["coverPhoto"] }
            public var reviewsCount: Int? { __data["reviewsCount"] }
            public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
            public var wishListStatus: Bool? { __data["wishListStatus"] }
            public var listPhotoName: String? { __data["listPhotoName"] }
            public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
            public var listingData: ListingData? { __data["listingData"] }
            public var settingsData: [SettingsDatum?]? { __data["settingsData"] }

            /// GetAllWishListGroup.Result.WishListCover.ListData.ListPhoto
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
                .field("type", String?.self),
                .field("status", String?.self),
              ] }

              public var id: Int? { __data["id"] }
              public var name: String? { __data["name"] }
              public var type: String? { __data["type"] }
              public var status: String? { __data["status"] }
            }

            /// GetAllWishListGroup.Result.WishListCover.ListData.ListingData
            ///
            /// Parent Type: `ListingData`
            public struct ListingData: PTProAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
              public static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("basePrice", Double?.self),
                .field("currency", String?.self),
              ] }

              public var basePrice: Double? { __data["basePrice"] }
              public var currency: String? { __data["currency"] }
            }

            /// GetAllWishListGroup.Result.WishListCover.ListData.SettingsDatum
            ///
            /// Parent Type: `UserListingData`
            public struct SettingsDatum: PTProAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
              public static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("listsettings", Listsettings?.self),
              ] }

              public var listsettings: Listsettings? { __data["listsettings"] }

              /// GetAllWishListGroup.Result.WishListCover.ListData.SettingsDatum.Listsettings
              ///
              /// Parent Type: `SingleListSettings`
              public struct Listsettings: PTProAPI.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: Apollo.ParentType { PTProAPI.Objects.SingleListSettings }
                public static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("id", Int?.self),
                  .field("itemName", String?.self),
                ] }

                public var id: Int? { __data["id"] }
                public var itemName: String? { __data["itemName"] }
              }
            }
          }
        }
      }
    }
  }
}
