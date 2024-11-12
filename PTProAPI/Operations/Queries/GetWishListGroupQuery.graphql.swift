// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetWishListGroupQuery: GraphQLQuery {
    static let operationName: String = "getWishListGroup"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getWishListGroup", GetWishListGroup?.self, arguments: [
          "id": .variable("id"),
          "currentPage": .variable("currentPage")
        ]),
      ] }

      var getWishListGroup: GetWishListGroup? { __data["getWishListGroup"] }

      /// GetWishListGroup
      ///
      /// Parent Type: `GetWishListType`
      struct GetWishListGroup: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetWishListType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// GetWishListGroup.Results
        ///
        /// Parent Type: `WishListGroup`
        struct Results: PTProAPI.SelectionSet {
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
            .field("wishLists", [WishList?]?.self),
          ] }

          var id: Int? { __data["id"] }
          var name: String? { __data["name"] }
          var userId: PTProAPI.ID { __data["userId"] }
          var isPublic: String? { __data["isPublic"] }
          var updatedAt: String? { __data["updatedAt"] }
          var wishListIds: [Int?]? { __data["wishListIds"] }
          var wishListCount: Int? { __data["wishListCount"] }
          var wishLists: [WishList?]? { __data["wishLists"] }

          /// GetWishListGroup.Results.WishList
          ///
          /// Parent Type: `WishList`
          struct WishList: PTProAPI.SelectionSet {
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

            /// GetWishListGroup.Results.WishList.ListData
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

              var id: Int? { __data["id"] }
              var title: String? { __data["title"] }
              var personCapacity: Int? { __data["personCapacity"] }
              var roomType: String? { __data["roomType"] }
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

              /// GetWishListGroup.Results.WishList.ListData.ListPhoto
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

              /// GetWishListGroup.Results.WishList.ListData.ListingData
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

              /// GetWishListGroup.Results.WishList.ListData.SettingsDatum
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

                /// GetWishListGroup.Results.WishList.ListData.SettingsDatum.Listsettings
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