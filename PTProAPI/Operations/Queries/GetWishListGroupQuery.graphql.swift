// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetWishListGroupQuery: GraphQLQuery {
  public static let operationName: String = "getWishListGroup"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getWishListGroup($id: Int!, $currentPage: Int) { getWishListGroup(id: $id, currentPage: $currentPage) { __typename status errorMessage results { __typename id name userId isPublic updatedAt wishListIds wishListCount wishLists { __typename id listId listData { __typename id title personCapacity roomType beds bookingType coverPhoto reviewsCount reviewsStarRating wishListStatus listPhotoName listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } } } } } }"#
    ))

  public var id: Int
  public var currentPage: GraphQLNullable<Int>

  public init(
    id: Int,
    currentPage: GraphQLNullable<Int>
  ) {
    self.id = id
    self.currentPage = currentPage
  }

  public var __variables: Variables? { [
    "id": id,
    "currentPage": currentPage
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getWishListGroup", GetWishListGroup?.self, arguments: [
        "id": .variable("id"),
        "currentPage": .variable("currentPage")
      ]),
    ] }

    public var getWishListGroup: GetWishListGroup? { __data["getWishListGroup"] }

    /// GetWishListGroup
    ///
    /// Parent Type: `GetWishListType`
    public struct GetWishListGroup: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetWishListType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", Results?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: Results? { __data["results"] }

      /// GetWishListGroup.Results
      ///
      /// Parent Type: `WishListGroup`
      public struct Results: PTProAPI.SelectionSet {
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
          .field("wishLists", [WishList?]?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var name: String? { __data["name"] }
        public var userId: PTProAPI.ID { __data["userId"] }
        public var isPublic: String? { __data["isPublic"] }
        public var updatedAt: String? { __data["updatedAt"] }
        public var wishListIds: [Int?]? { __data["wishListIds"] }
        public var wishListCount: Int? { __data["wishListCount"] }
        public var wishLists: [WishList?]? { __data["wishLists"] }

        /// GetWishListGroup.Results.WishList
        ///
        /// Parent Type: `WishList`
        public struct WishList: PTProAPI.SelectionSet {
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

          /// GetWishListGroup.Results.WishList.ListData
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
              .field("roomType", String?.self),
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
            public var roomType: String? { __data["roomType"] }
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

            /// GetWishListGroup.Results.WishList.ListData.ListPhoto
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

            /// GetWishListGroup.Results.WishList.ListData.ListingData
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

            /// GetWishListGroup.Results.WishList.ListData.SettingsDatum
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

              /// GetWishListGroup.Results.WishList.ListData.SettingsDatum.Listsettings
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
