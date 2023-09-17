// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetDefaultSettingQuery: GraphQLQuery {
  public static let operationName: String = "getDefaultSetting"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getDefaultSetting { getMostViewedListing { __typename results { __typename id title personCapacity beds bookingType coverPhoto reviewsCount reviewsStarRating listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } wishListStatus isListOwner listPhotoName roomType popularLocationListing { __typename id location locationAddress image isEnable createdAt updatedAt } } status errorMessage } getRecommend { __typename results { __typename id title personCapacity beds bookingType coverPhoto reviewsCount reviewsStarRating listPhotos { __typename id name type status } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } wishListStatus isListOwner listPhotoName roomType } status } Currency { __typename result { __typename base rates } status errorMessage } getSearchSettings { __typename results { __typename id minPrice maxPrice priceRangeCurrency } status errorMessage } getListingSettingsCommon { __typename status errorMessage results { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id image typeId itemName otherItemName maximum minimum startValue endValue isEnable } } } siteSettings { __typename status errorMessage results { __typename id title name value type status } } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getMostViewedListing", GetMostViewedListing?.self),
      .field("getRecommend", GetRecommend?.self),
      .field("Currency", Currency?.self),
      .field("getSearchSettings", GetSearchSettings?.self),
      .field("getListingSettingsCommon", GetListingSettingsCommon?.self),
      .field("siteSettings", SiteSettings?.self),
    ] }

    public var getMostViewedListing: GetMostViewedListing? { __data["getMostViewedListing"] }
    public var getRecommend: GetRecommend? { __data["getRecommend"] }
    public var currency: Currency? { __data["Currency"] }
    public var getSearchSettings: GetSearchSettings? { __data["getSearchSettings"] }
    public var getListingSettingsCommon: GetListingSettingsCommon? { __data["getListingSettingsCommon"] }
    public var siteSettings: SiteSettings? { __data["siteSettings"] }

    /// GetMostViewedListing
    ///
    /// Parent Type: `AllList`
    public struct GetMostViewedListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetMostViewedListing.Result
      ///
      /// Parent Type: `ShowListing`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [ApolloAPI.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var beds: Int? { __data["beds"] }
        public var bookingType: String? { __data["bookingType"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var settingsData: [SettingsDatum?]? { __data["settingsData"] }
        public var wishListStatus: Bool? { __data["wishListStatus"] }
        public var isListOwner: Bool? { __data["isListOwner"] }
        public var listPhotoName: String? { __data["listPhotoName"] }
        public var roomType: String? { __data["roomType"] }
        public var popularLocationListing: [PopularLocationListing?]? { __data["popularLocationListing"] }

        /// GetMostViewedListing.Result.ListPhoto
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
            .field("type", String?.self),
            .field("status", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
          public var status: String? { __data["status"] }
        }

        /// GetMostViewedListing.Result.ListingData
        ///
        /// Parent Type: `ListingData`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("basePrice", Double?.self),
            .field("currency", String?.self),
          ] }

          public var basePrice: Double? { __data["basePrice"] }
          public var currency: String? { __data["currency"] }
        }

        /// GetMostViewedListing.Result.SettingsDatum
        ///
        /// Parent Type: `UserListingData`
        public struct SettingsDatum: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserListingData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("listsettings", Listsettings?.self),
          ] }

          public var listsettings: Listsettings? { __data["listsettings"] }

          /// GetMostViewedListing.Result.SettingsDatum.Listsettings
          ///
          /// Parent Type: `SingleListSettings`
          public struct Listsettings: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SingleListSettings }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("itemName", String?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var itemName: String? { __data["itemName"] }
          }
        }

        /// GetMostViewedListing.Result.PopularLocationListing
        ///
        /// Parent Type: `PopularLocationListing`
        public struct PopularLocationListing: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.PopularLocationListing }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("location", String?.self),
            .field("locationAddress", String?.self),
            .field("image", String?.self),
            .field("isEnable", String?.self),
            .field("createdAt", String?.self),
            .field("updatedAt", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var location: String? { __data["location"] }
          public var locationAddress: String? { __data["locationAddress"] }
          public var image: String? { __data["image"] }
          public var isEnable: String? { __data["isEnable"] }
          public var createdAt: String? { __data["createdAt"] }
          public var updatedAt: String? { __data["updatedAt"] }
        }
      }
    }

    /// GetRecommend
    ///
    /// Parent Type: `AllList`
    public struct GetRecommend: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }

      /// GetRecommend.Result
      ///
      /// Parent Type: `ShowListing`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [ApolloAPI.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var beds: Int? { __data["beds"] }
        public var bookingType: String? { __data["bookingType"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
        public var reviewsCount: Int? { __data["reviewsCount"] }
        public var reviewsStarRating: Int? { __data["reviewsStarRating"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var settingsData: [SettingsDatum?]? { __data["settingsData"] }
        public var wishListStatus: Bool? { __data["wishListStatus"] }
        public var isListOwner: Bool? { __data["isListOwner"] }
        public var listPhotoName: String? { __data["listPhotoName"] }
        public var roomType: String? { __data["roomType"] }

        /// GetRecommend.Result.ListPhoto
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
            .field("type", String?.self),
            .field("status", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
          public var status: String? { __data["status"] }
        }

        /// GetRecommend.Result.ListingData
        ///
        /// Parent Type: `ListingData`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("basePrice", Double?.self),
            .field("currency", String?.self),
          ] }

          public var basePrice: Double? { __data["basePrice"] }
          public var currency: String? { __data["currency"] }
        }

        /// GetRecommend.Result.SettingsDatum
        ///
        /// Parent Type: `UserListingData`
        public struct SettingsDatum: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserListingData }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("listsettings", Listsettings?.self),
          ] }

          public var listsettings: Listsettings? { __data["listsettings"] }

          /// GetRecommend.Result.SettingsDatum.Listsettings
          ///
          /// Parent Type: `SingleListSettings`
          public struct Listsettings: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SingleListSettings }
            public static var __selections: [ApolloAPI.Selection] { [
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

    /// Currency
    ///
    /// Parent Type: `Currency`
    public struct Currency: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Currency }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("result", Result?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: Result? { __data["result"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// Currency.Result
      ///
      /// Parent Type: `AllRatesType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllRatesType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("base", String?.self),
          .field("rates", String?.self),
        ] }

        public var base: String? { __data["base"] }
        public var rates: String? { __data["rates"] }
      }
    }

    /// GetSearchSettings
    ///
    /// Parent Type: `AllSearchSettingsType`
    public struct GetSearchSettings: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AllSearchSettingsType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetSearchSettings.Results
      ///
      /// Parent Type: `SearchSettingsType`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SearchSettingsType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("minPrice", Double?.self),
          .field("maxPrice", Double?.self),
          .field("priceRangeCurrency", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var minPrice: Double? { __data["minPrice"] }
        public var maxPrice: Double? { __data["maxPrice"] }
        public var priceRangeCurrency: String? { __data["priceRangeCurrency"] }
      }
    }

    /// GetListingSettingsCommon
    ///
    /// Parent Type: `ListingSettingCommonTypes`
    public struct GetListingSettingsCommon: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingSettingCommonTypes }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: [Result?]? { __data["results"] }

      /// GetListingSettingsCommon.Result
      ///
      /// Parent Type: `ListingSettingsTypesCommon`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingSettingsTypesCommon }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("typeName", String?.self),
          .field("fieldType", String?.self),
          .field("typeLabel", String?.self),
          .field("step", String?.self),
          .field("isEnable", String?.self),
          .field("listSettings", [ListSetting?]?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var typeName: String? { __data["typeName"] }
        public var fieldType: String? { __data["fieldType"] }
        public var typeLabel: String? { __data["typeLabel"] }
        public var step: String? { __data["step"] }
        public var isEnable: String? { __data["isEnable"] }
        public var listSettings: [ListSetting?]? { __data["listSettings"] }

        /// GetListingSettingsCommon.Result.ListSetting
        ///
        /// Parent Type: `ListingSettingsCommon`
        public struct ListSetting: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingSettingsCommon }
          public static var __selections: [ApolloAPI.Selection] { [
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

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var typeId: Int? { __data["typeId"] }
          public var itemName: String? { __data["itemName"] }
          public var otherItemName: String? { __data["otherItemName"] }
          public var maximum: Int? { __data["maximum"] }
          public var minimum: Int? { __data["minimum"] }
          public var startValue: Int? { __data["startValue"] }
          public var endValue: Int? { __data["endValue"] }
          public var isEnable: String? { __data["isEnable"] }
        }
      }
    }

    /// SiteSettings
    ///
    /// Parent Type: `SiteSettingsCommon`
    public struct SiteSettings: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SiteSettingsCommon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: [Result?]? { __data["results"] }

      /// SiteSettings.Result
      ///
      /// Parent Type: `SiteSettings`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SiteSettings }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("title", String?.self),
          .field("name", String?.self),
          .field("value", String?.self),
          .field("type", String?.self),
          .field("status", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var name: String? { __data["name"] }
        public var value: String? { __data["value"] }
        public var type: String? { __data["type"] }
        public var status: String? { __data["status"] }
      }
    }
  }
}
