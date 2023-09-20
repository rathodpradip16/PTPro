// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ManageListingsQuery: GraphQLQuery {
  public static let operationName: String = "ManageListings"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query ManageListings { ManageListings { __typename results { __typename id title city updatedAt coverPhoto isPublished isReady listApprovalStatus listPhotoName listPhotos { __typename id name } listingData { __typename basePrice currency } settingsData { __typename listsettings { __typename id itemName } } listingSteps { __typename id step1 step2 step3 } user { __typename userBanStatus } } status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("ManageListings", ManageListings?.self),
    ] }

    public var manageListings: ManageListings? { __data["ManageListings"] }

    /// ManageListings
    ///
    /// Parent Type: `WholeManageListingsType`
    public struct ManageListings: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.WholeManageListingsType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ManageListings.Result
      ///
      /// Parent Type: `ShowListing`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [Apollo.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var city: String? { __data["city"] }
        public var updatedAt: String? { __data["updatedAt"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
        public var isPublished: Bool? { __data["isPublished"] }
        public var isReady: Bool? { __data["isReady"] }
        public var listApprovalStatus: String? { __data["listApprovalStatus"] }
        public var listPhotoName: String? { __data["listPhotoName"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var settingsData: [SettingsDatum?]? { __data["settingsData"] }
        public var listingSteps: ListingSteps? { __data["listingSteps"] }
        public var user: User? { __data["user"] }

        /// ManageListings.Result.ListPhoto
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

        /// ManageListings.Result.ListingData
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

        /// ManageListings.Result.SettingsDatum
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

          /// ManageListings.Result.SettingsDatum.Listsettings
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

        /// ManageListings.Result.ListingSteps
        ///
        /// Parent Type: `UserListingSteps`
        public struct ListingSteps: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingSteps }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("step1", String?.self),
            .field("step2", String?.self),
            .field("step3", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var step1: String? { __data["step1"] }
          public var step2: String? { __data["step2"] }
          public var step3: String? { __data["step3"] }
        }

        /// ManageListings.Result.User
        ///
        /// Parent Type: `User`
        public struct User: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.User }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userBanStatus", Int?.self),
          ] }

          public var userBanStatus: Int? { __data["userBanStatus"] }
        }
      }
    }
  }
}
