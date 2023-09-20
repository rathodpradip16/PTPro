// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetStep1ListingDetailsQuery: GraphQLQuery {
  public static let operationName: String = "getStep1ListingDetails"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getStep1ListingDetails($listId: String!, $preview: Boolean) { getListingDetails(listId: $listId, preview: $preview) { __typename status errorMessage results { __typename id userId country street buildingName city state zipcode lat lng isMapTouched bedrooms residenceType beds personCapacity bathrooms user { __typename email userBanStatus profile { __typename firstName lastName dateOfBirth } } userAmenities { __typename id image itemName } userSafetyAmenities { __typename id image itemName } userSpaces { __typename id itemName } settingsData { __typename id settingsId listsettings { __typename id itemName settingsType { __typename typeName } } } userBedsTypes { __typename id listId bedCount bedType } } } }"#
    ))

  public var listId: String
  public var preview: GraphQLNullable<Bool>

  public init(
    listId: String,
    preview: GraphQLNullable<Bool>
  ) {
    self.listId = listId
    self.preview = preview
  }

  public var __variables: Variables? { [
    "listId": listId,
    "preview": preview
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getListingDetails", GetListingDetails?.self, arguments: [
        "listId": .variable("listId"),
        "preview": .variable("preview")
      ]),
    ] }

    public var getListingDetails: GetListingDetails? { __data["getListingDetails"] }

    /// GetListingDetails
    ///
    /// Parent Type: `AllListing`
    public struct GetListingDetails: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListing }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", Results?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: Results? { __data["results"] }

      /// GetListingDetails.Results
      ///
      /// Parent Type: `ShowListing`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("userId", String?.self),
          .field("country", String?.self),
          .field("street", String?.self),
          .field("buildingName", String?.self),
          .field("city", String?.self),
          .field("state", String?.self),
          .field("zipcode", String?.self),
          .field("lat", Double?.self),
          .field("lng", Double?.self),
          .field("isMapTouched", Bool?.self),
          .field("bedrooms", String?.self),
          .field("residenceType", String?.self),
          .field("beds", Int?.self),
          .field("personCapacity", Int?.self),
          .field("bathrooms", Double?.self),
          .field("user", User?.self),
          .field("userAmenities", [UserAmenity?]?.self),
          .field("userSafetyAmenities", [UserSafetyAmenity?]?.self),
          .field("userSpaces", [UserSpace?]?.self),
          .field("settingsData", [SettingsDatum?]?.self),
          .field("userBedsTypes", [UserBedsType?]?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var userId: String? { __data["userId"] }
        public var country: String? { __data["country"] }
        public var street: String? { __data["street"] }
        public var buildingName: String? { __data["buildingName"] }
        public var city: String? { __data["city"] }
        public var state: String? { __data["state"] }
        public var zipcode: String? { __data["zipcode"] }
        public var lat: Double? { __data["lat"] }
        public var lng: Double? { __data["lng"] }
        public var isMapTouched: Bool? { __data["isMapTouched"] }
        public var bedrooms: String? { __data["bedrooms"] }
        public var residenceType: String? { __data["residenceType"] }
        public var beds: Int? { __data["beds"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var bathrooms: Double? { __data["bathrooms"] }
        public var user: User? { __data["user"] }
        public var userAmenities: [UserAmenity?]? { __data["userAmenities"] }
        public var userSafetyAmenities: [UserSafetyAmenity?]? { __data["userSafetyAmenities"] }
        public var userSpaces: [UserSpace?]? { __data["userSpaces"] }
        public var settingsData: [SettingsDatum?]? { __data["settingsData"] }
        public var userBedsTypes: [UserBedsType?]? { __data["userBedsTypes"] }

        /// GetListingDetails.Results.User
        ///
        /// Parent Type: `User`
        public struct User: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.User }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("email", String?.self),
            .field("userBanStatus", Int?.self),
            .field("profile", Profile?.self),
          ] }

          public var email: String? { __data["email"] }
          public var userBanStatus: Int? { __data["userBanStatus"] }
          public var profile: Profile? { __data["profile"] }

          /// GetListingDetails.Results.User.Profile
          ///
          /// Parent Type: `Profile`
          public struct Profile: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Profile }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("firstName", String?.self),
              .field("lastName", String?.self),
              .field("dateOfBirth", String?.self),
            ] }

            public var firstName: String? { __data["firstName"] }
            public var lastName: String? { __data["lastName"] }
            public var dateOfBirth: String? { __data["dateOfBirth"] }
          }
        }

        /// GetListingDetails.Results.UserAmenity
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct UserAmenity: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("image", String?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// GetListingDetails.Results.UserSafetyAmenity
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct UserSafetyAmenity: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("image", String?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var image: String? { __data["image"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// GetListingDetails.Results.UserSpace
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct UserSpace: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("itemName", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var itemName: String? { __data["itemName"] }
        }

        /// GetListingDetails.Results.SettingsDatum
        ///
        /// Parent Type: `UserListingData`
        public struct SettingsDatum: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("settingsId", Int?.self),
            .field("listsettings", Listsettings?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var settingsId: Int? { __data["settingsId"] }
          public var listsettings: Listsettings? { __data["listsettings"] }

          /// GetListingDetails.Results.SettingsDatum.Listsettings
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
              .field("settingsType", SettingsType?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var itemName: String? { __data["itemName"] }
            public var settingsType: SettingsType? { __data["settingsType"] }

            /// GetListingDetails.Results.SettingsDatum.Listsettings.SettingsType
            ///
            /// Parent Type: `ListSettingsTypes`
            public struct SettingsType: PTProAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListSettingsTypes }
              public static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("typeName", String?.self),
              ] }

              public var typeName: String? { __data["typeName"] }
            }
          }
        }

        /// GetListingDetails.Results.UserBedsType
        ///
        /// Parent Type: `BedTypes`
        public struct UserBedsType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.BedTypes }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("bedCount", Int?.self),
            .field("bedType", Int?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var listId: Int? { __data["listId"] }
          public var bedCount: Int? { __data["bedCount"] }
          public var bedType: Int? { __data["bedType"] }
        }
      }
    }
  }
}
