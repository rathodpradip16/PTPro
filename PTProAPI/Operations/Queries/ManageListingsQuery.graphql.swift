// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ManageListingsQuery: GraphQLQuery {
    static let operationName: String = "ManageListings"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query ManageListings { ManageListings { __typename results { __typename id title city updatedAt coverPhoto isPublished isReady listApprovalStatus listPhotoName listPhotos { __typename id name } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } listingSteps { __typename id step1 step2 step3 } user { __typename userBanStatus } } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("ManageListings", ManageListings?.self),
      ] }

      var manageListings: ManageListings? { __data["ManageListings"] }

      /// ManageListings
      ///
      /// Parent Type: `WholeManageListingsType`
      struct ManageListings: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.WholeManageListingsType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// ManageListings.Result
        ///
        /// Parent Type: `ShowListing`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("city", String?.self),
            .field("updatedAt", String?.self),
            .field("coverPhoto", Int?.self),
            .field("isPublished", Bool?.self),
            .field("isReady", Bool?.self),
            .field("listApprovalStatus", String?.self),
            .field("listPhotoName", String?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
            .field("settingsData", [SettingsDatum?]?.self),
            .field("listingSteps", ListingSteps?.self),
            .field("user", User?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var city: String? { __data["city"] }
          var updatedAt: String? { __data["updatedAt"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
          var isPublished: Bool? { __data["isPublished"] }
          var isReady: Bool? { __data["isReady"] }
          var listApprovalStatus: String? { __data["listApprovalStatus"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingData: ListingData? { __data["listingData"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var listingSteps: ListingSteps? { __data["listingSteps"] }
          var user: User? { __data["user"] }

          /// ManageListings.Result.ListPhoto
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

          /// ManageListings.Result.ListingData
          ///
          /// Parent Type: `ListingData`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("basePrice", Double?.self),
              .field("currency", String?.self),
            ] }

            var basePrice: Double? { __data["basePrice"] }
            var currency: String? { __data["currency"] }
          }

          /// ManageListings.Result.SettingsDatum
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

            /// ManageListings.Result.SettingsDatum.Listsettings
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

          /// ManageListings.Result.ListingSteps
          ///
          /// Parent Type: `UserListingSteps`
          struct ListingSteps: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingSteps }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("step1", String?.self),
              .field("step2", String?.self),
              .field("step3", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var step1: String? { __data["step1"] }
            var step2: String? { __data["step2"] }
            var step3: String? { __data["step3"] }
          }

          /// ManageListings.Result.User
          ///
          /// Parent Type: `User`
          struct User: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.User }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userBanStatus", Int?.self),
            ] }

            var userBanStatus: Int? { __data["userBanStatus"] }
          }
        }
      }
    }
  }

}