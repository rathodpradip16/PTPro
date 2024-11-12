// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetAllWishListGroupQuery: GraphQLQuery {
    static let operationName: String = "getAllWishListGroup"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getAllWishListGroup($currentPage: Int) { getAllWishListGroup(currentPage: $currentPage) { __typename status count errorMessage results { __typename id name userId isPublic updatedAt wishListIds wishListCount wishListCover { __typename id listId listData { __typename id title personCapacity beds bookingType coverPhoto reviewsCount reviewsStarRating wishListStatus listPhotoName listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } } } } } }"#
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
        .field("getAllWishListGroup", GetAllWishListGroup?.self, arguments: ["currentPage": .variable("currentPage")]),
      ] }

      var getAllWishListGroup: GetAllWishListGroup? { __data["getAllWishListGroup"] }

      /// GetAllWishListGroup
      ///
      /// Parent Type: `AllWishListGroup`
      struct GetAllWishListGroup: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllWishListGroup }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("count", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var count: Int? { __data["count"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: [Result?]? { __data["results"] }

        /// GetAllWishListGroup.Result
        ///
        /// Parent Type: `WishListGroup`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishListGroup }
          static var __selections: [Apollo.Selection] { [
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

          var id: Int? { __data["id"] }
          var name: String? { __data["name"] }
          var userId: PTProAPI.ID { __data["userId"] }
          var isPublic: String? { __data["isPublic"] }
          var updatedAt: String? { __data["updatedAt"] }
          var wishListIds: [Int?]? { __data["wishListIds"] }
          var wishListCount: Int? { __data["wishListCount"] }
          var wishListCover: WishListCover? { __data["wishListCover"] }

          /// GetAllWishListGroup.Result.WishListCover
          ///
          /// Parent Type: `WishList`
          struct WishListCover: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.WishList }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("listId", Int?.self),
              .field("listData", ListData?.self),
            ] }

            var id: Int? { __data["id"] }
            var listId: Int? { __data["listId"] }
            var listData: ListData? { __data["listData"] }

            /// GetAllWishListGroup.Result.WishListCover.ListData
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

              var id: Int? { __data["id"] }
              var title: String? { __data["title"] }
              var personCapacity: Int? { __data["personCapacity"] }
              var beds: Int? { __data["beds"] }
              var bookingType: String? { __data["bookingType"] }
              var coverPhoto: Int? { __data["coverPhoto"] }
              var reviewsCount: Int? { __data["reviewsCount"] }
              var reviewsStarRating: Int? { __data["reviewsStarRating"] }
              var wishListStatus: Bool? { __data["wishListStatus"] }
              var listPhotoName: String? { __data["listPhotoName"] }
              var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
              var listingData: ListingData? { __data["listingData"] }
              var settingsData: [SettingsDatum?]? { __data["settingsData"] }

              /// GetAllWishListGroup.Result.WishListCover.ListData.ListPhoto
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
                  .field("type", String?.self),
                  .field("status", String?.self),
                ] }

                var id: Int? { __data["id"] }
                var name: String? { __data["name"] }
                var type: String? { __data["type"] }
                var status: String? { __data["status"] }
              }

              /// GetAllWishListGroup.Result.WishListCover.ListData.ListingData
              ///
              /// Parent Type: `ListingDatas`
              struct ListingData: PTProAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingDatas }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("basePrice", Double?.self),
                  .field("currency", String?.self),
                ] }

                var basePrice: Double? { __data["basePrice"] }
                var currency: String? { __data["currency"] }
              }

              /// GetAllWishListGroup.Result.WishListCover.ListData.SettingsDatum
              ///
              /// Parent Type: `UserListingData`
              struct SettingsDatum: PTProAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("listsettings", Listsettings?.self),
                ] }

                var listsettings: Listsettings? { __data["listsettings"] }

                /// GetAllWishListGroup.Result.WishListCover.ListData.SettingsDatum.Listsettings
                ///
                /// Parent Type: `SingleListSettings`
                struct Listsettings: PTProAPI.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: Apollo.ParentType { PTProAPI.Objects.SingleListSettings }
                  static var __selections: [Apollo.Selection] { [
                    .field("__typename", String.self),
                    .field("id", Int?.self),
                    .field("itemName", String?.self),
                  ] }

                  var id: Int? { __data["id"] }
                  var itemName: String? { __data["itemName"] }
                }
              }
            }
          }
        }
      }
    }
  }

}