// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetDefaultSettingQuery: GraphQLQuery {
    static let operationName: String = "getDefaultSetting"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getDefaultSetting { getMostViewedListing { __typename results { __typename id title personCapacity beds bookingType coverPhoto reviewsCount reviewsStarRating listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } wishListStatus isListOwner listPhotoName roomType popularLocationListing { __typename id location locationAddress image isEnable createdAt updatedAt } } status errorMessage } getRecommend { __typename results { __typename id title personCapacity beds bookingType coverPhoto reviewsCount reviewsStarRating listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } wishListStatus isListOwner listPhotoName roomType } status } Currency { __typename result { __typename base rates } status errorMessage } getSearchSettings { __typename results { __typename id minPrice maxPrice priceRangeCurrency } status errorMessage } getListingSettingsCommon { __typename status errorMessage results { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id image typeId itemName otherItemName maximum minimum startValue endValue isEnable } } } siteSettings { __typename status errorMessage results { __typename id title name value type status } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getMostViewedListing", GetMostViewedListing?.self),
        .field("getRecommend", GetRecommend?.self),
        .field("Currency", Currency?.self),
        .field("getSearchSettings", GetSearchSettings?.self),
        .field("getListingSettingsCommon", GetListingSettingsCommon?.self),
        .field("siteSettings", SiteSettings?.self),
      ] }

      var getMostViewedListing: GetMostViewedListing? { __data["getMostViewedListing"] }
      var getRecommend: GetRecommend? { __data["getRecommend"] }
      var currency: Currency? { __data["Currency"] }
      var getSearchSettings: GetSearchSettings? { __data["getSearchSettings"] }
      var getListingSettingsCommon: GetListingSettingsCommon? { __data["getListingSettingsCommon"] }
      var siteSettings: SiteSettings? { __data["siteSettings"] }

      /// GetMostViewedListing
      ///
      /// Parent Type: `AllList`
      struct GetMostViewedListing: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllList }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetMostViewedListing.Result
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
            .field("personCapacity", Int?.self),
            .field("beds", Int?.self),
            .field("bookingType", String?.self),
            .field("coverPhoto", Int?.self),
            .field("reviewsCount", Int?.self),
            .field("reviewsStarRating", Int?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
            .field("settingsData", [SettingsDatum?]?.self),
            .field("wishListStatus", Bool?.self),
            .field("isListOwner", Bool?.self),
            .field("listPhotoName", String?.self),
            .field("roomType", String?.self),
            .field("popularLocationListing", [PopularLocationListing?]?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var beds: Int? { __data["beds"] }
          var bookingType: String? { __data["bookingType"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingData: ListingData? { __data["listingData"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var isListOwner: Bool? { __data["isListOwner"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var roomType: String? { __data["roomType"] }
          var popularLocationListing: [PopularLocationListing?]? { __data["popularLocationListing"] }

          /// GetMostViewedListing.Result.ListPhoto
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

          /// GetMostViewedListing.Result.ListingData
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

          /// GetMostViewedListing.Result.SettingsDatum
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

            /// GetMostViewedListing.Result.SettingsDatum.Listsettings
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

          /// GetMostViewedListing.Result.PopularLocationListing
          ///
          /// Parent Type: `PopularLocationListing`
          struct PopularLocationListing: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.PopularLocationListing }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("location", String?.self),
              .field("locationAddress", String?.self),
              .field("image", String?.self),
              .field("isEnable", String?.self),
              .field("createdAt", String?.self),
              .field("updatedAt", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var location: String? { __data["location"] }
            var locationAddress: String? { __data["locationAddress"] }
            var image: String? { __data["image"] }
            var isEnable: String? { __data["isEnable"] }
            var createdAt: String? { __data["createdAt"] }
            var updatedAt: String? { __data["updatedAt"] }
          }
        }
      }

      /// GetRecommend
      ///
      /// Parent Type: `AllList`
      struct GetRecommend: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllList }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }

        /// GetRecommend.Result
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
            .field("personCapacity", Int?.self),
            .field("beds", Int?.self),
            .field("bookingType", String?.self),
            .field("coverPhoto", Int?.self),
            .field("reviewsCount", Int?.self),
            .field("reviewsStarRating", Int?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
            .field("settingsData", [SettingsDatum?]?.self),
            .field("wishListStatus", Bool?.self),
            .field("isListOwner", Bool?.self),
            .field("listPhotoName", String?.self),
            .field("roomType", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var beds: Int? { __data["beds"] }
          var bookingType: String? { __data["bookingType"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
          var reviewsCount: Int? { __data["reviewsCount"] }
          var reviewsStarRating: Int? { __data["reviewsStarRating"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingData: ListingData? { __data["listingData"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var wishListStatus: Bool? { __data["wishListStatus"] }
          var isListOwner: Bool? { __data["isListOwner"] }
          var listPhotoName: String? { __data["listPhotoName"] }
          var roomType: String? { __data["roomType"] }

          /// GetRecommend.Result.ListPhoto
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

          /// GetRecommend.Result.ListingData
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

          /// GetRecommend.Result.SettingsDatum
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

            /// GetRecommend.Result.SettingsDatum.Listsettings
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

      /// Currency
      ///
      /// Parent Type: `Currency`
      struct Currency: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Currency }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", Result?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: Result? { __data["result"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// Currency.Result
        ///
        /// Parent Type: `AllRatesType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllRatesType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("base", String?.self),
            .field("rates", String?.self),
          ] }

          var base: String? { __data["base"] }
          var rates: String? { __data["rates"] }
        }
      }

      /// GetSearchSettings
      ///
      /// Parent Type: `AllSearchSettingsType`
      struct GetSearchSettings: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllSearchSettingsType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetSearchSettings.Results
        ///
        /// Parent Type: `SearchSettingsType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.SearchSettingsType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("minPrice", Double?.self),
            .field("maxPrice", Double?.self),
            .field("priceRangeCurrency", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var minPrice: Double? { __data["minPrice"] }
          var maxPrice: Double? { __data["maxPrice"] }
          var priceRangeCurrency: String? { __data["priceRangeCurrency"] }
        }
      }

      /// GetListingSettingsCommon
      ///
      /// Parent Type: `ListingSettingCommonTypes`
      struct GetListingSettingsCommon: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingCommonTypes }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: [Result?]? { __data["results"] }

        /// GetListingSettingsCommon.Result
        ///
        /// Parent Type: `ListingSettingsTypesCommon`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypesCommon }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("typeName", String?.self),
            .field("fieldType", String?.self),
            .field("typeLabel", String?.self),
            .field("step", String?.self),
            .field("isEnable", String?.self),
            .field("listSettings", [ListSetting?]?.self),
          ] }

          var id: Int? { __data["id"] }
          var typeName: String? { __data["typeName"] }
          var fieldType: String? { __data["fieldType"] }
          var typeLabel: String? { __data["typeLabel"] }
          var step: String? { __data["step"] }
          var isEnable: String? { __data["isEnable"] }
          var listSettings: [ListSetting?]? { __data["listSettings"] }

          /// GetListingSettingsCommon.Result.ListSetting
          ///
          /// Parent Type: `ListingSettingsCommon`
          struct ListSetting: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsCommon }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("image", String?.self),
              .field("typeId", Int?.self),
              .field("itemName", String?.self),
              .field("otherItemName", String?.self),
              .field("maximum", Int?.self),
              .field("minimum", Int?.self),
              .field("startValue", Int?.self),
              .field("endValue", Int?.self),
              .field("isEnable", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var image: String? { __data["image"] }
            var typeId: Int? { __data["typeId"] }
            var itemName: String? { __data["itemName"] }
            var otherItemName: String? { __data["otherItemName"] }
            var maximum: Int? { __data["maximum"] }
            var minimum: Int? { __data["minimum"] }
            var startValue: Int? { __data["startValue"] }
            var endValue: Int? { __data["endValue"] }
            var isEnable: String? { __data["isEnable"] }
          }
        }
      }

      /// SiteSettings
      ///
      /// Parent Type: `SiteSettingsCommon`
      struct SiteSettings: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SiteSettingsCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: [Result?]? { __data["results"] }

        /// SiteSettings.Result
        ///
        /// Parent Type: `SiteSettings`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.SiteSettings }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("name", String?.self),
            .field("value", String?.self),
            .field("type", String?.self),
            .field("status", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var name: String? { __data["name"] }
          var value: String? { __data["value"] }
          var type: String? { __data["type"] }
          var status: String? { __data["status"] }
        }
      }
    }
  }

}