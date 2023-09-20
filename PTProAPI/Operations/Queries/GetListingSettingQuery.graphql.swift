// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetListingSettingQuery: GraphQLQuery {
  public static let operationName: String = "getListingSetting"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getListingSetting { getListingSettings { __typename status results { __typename roomType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable image } } personCapacity { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } houseType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } buildingSize { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bedrooms { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } beds { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bedType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bathrooms { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bathroomType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } amenities { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id image typeId itemName otherItemName maximum minimum startValue endValue isEnable } } safetyAmenities { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id image typeId itemName otherItemName maximum minimum startValue endValue isEnable } } spaces { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } guestRequirements { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } houseRules { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } reviewGuestBook { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bookingNoticeTime { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } maxDaysNotice { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } minNight { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } maxNight { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } } } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getListingSettings", GetListingSettings?.self),
    ] }

    public var getListingSettings: GetListingSettings? { __data["getListingSettings"] }

    /// GetListingSettings
    ///
    /// Parent Type: `ListingSettingsCommonTypes`
    public struct GetListingSettings: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsCommonTypes }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("results", Results?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var results: Results? { __data["results"] }

      /// GetListingSettings.Results
      ///
      /// Parent Type: `SettingsType`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.SettingsType }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("roomType", RoomType?.self),
          .field("personCapacity", PersonCapacity?.self),
          .field("houseType", HouseType?.self),
          .field("buildingSize", BuildingSize?.self),
          .field("bedrooms", Bedrooms?.self),
          .field("beds", Beds?.self),
          .field("bedType", BedType?.self),
          .field("bathrooms", Bathrooms?.self),
          .field("bathroomType", BathroomType?.self),
          .field("amenities", Amenities?.self),
          .field("safetyAmenities", SafetyAmenities?.self),
          .field("spaces", Spaces?.self),
          .field("guestRequirements", GuestRequirements?.self),
          .field("houseRules", HouseRules?.self),
          .field("reviewGuestBook", ReviewGuestBook?.self),
          .field("bookingNoticeTime", BookingNoticeTime?.self),
          .field("maxDaysNotice", MaxDaysNotice?.self),
          .field("minNight", MinNight?.self),
          .field("maxNight", MaxNight?.self),
        ] }

        public var roomType: RoomType? { __data["roomType"] }
        public var personCapacity: PersonCapacity? { __data["personCapacity"] }
        public var houseType: HouseType? { __data["houseType"] }
        public var buildingSize: BuildingSize? { __data["buildingSize"] }
        public var bedrooms: Bedrooms? { __data["bedrooms"] }
        public var beds: Beds? { __data["beds"] }
        public var bedType: BedType? { __data["bedType"] }
        public var bathrooms: Bathrooms? { __data["bathrooms"] }
        public var bathroomType: BathroomType? { __data["bathroomType"] }
        public var amenities: Amenities? { __data["amenities"] }
        public var safetyAmenities: SafetyAmenities? { __data["safetyAmenities"] }
        public var spaces: Spaces? { __data["spaces"] }
        public var guestRequirements: GuestRequirements? { __data["guestRequirements"] }
        public var houseRules: HouseRules? { __data["houseRules"] }
        public var reviewGuestBook: ReviewGuestBook? { __data["reviewGuestBook"] }
        public var bookingNoticeTime: BookingNoticeTime? { __data["bookingNoticeTime"] }
        public var maxDaysNotice: MaxDaysNotice? { __data["maxDaysNotice"] }
        public var minNight: MinNight? { __data["minNight"] }
        public var maxNight: MaxNight? { __data["maxNight"] }

        /// GetListingSettings.Results.RoomType
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct RoomType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.RoomType.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("typeId", Int?.self),
              .field("itemName", String?.self),
              .field("otherItemName", String?.self),
              .field("maximum", Int?.self),
              .field("minimum", Int?.self),
              .field("startValue", Int?.self),
              .field("endValue", Int?.self),
              .field("isEnable", String?.self),
              .field("image", String?.self),
            ] }

            public var id: Int? { __data["id"] }
            public var typeId: Int? { __data["typeId"] }
            public var itemName: String? { __data["itemName"] }
            public var otherItemName: String? { __data["otherItemName"] }
            public var maximum: Int? { __data["maximum"] }
            public var minimum: Int? { __data["minimum"] }
            public var startValue: Int? { __data["startValue"] }
            public var endValue: Int? { __data["endValue"] }
            public var isEnable: String? { __data["isEnable"] }
            public var image: String? { __data["image"] }
          }
        }

        /// GetListingSettings.Results.PersonCapacity
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct PersonCapacity: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.PersonCapacity.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.HouseType
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct HouseType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.HouseType.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.BuildingSize
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct BuildingSize: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.BuildingSize.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.Bedrooms
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct Bedrooms: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.Bedrooms.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.Beds
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct Beds: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.Beds.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.BedType
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct BedType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.BedType.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.Bathrooms
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct Bathrooms: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.Bathrooms.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.BathroomType
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct BathroomType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.BathroomType.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.Amenities
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct Amenities: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.Amenities.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
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

        /// GetListingSettings.Results.SafetyAmenities
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct SafetyAmenities: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.SafetyAmenities.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
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

        /// GetListingSettings.Results.Spaces
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct Spaces: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.Spaces.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.GuestRequirements
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct GuestRequirements: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.GuestRequirements.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.HouseRules
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct HouseRules: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.HouseRules.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.ReviewGuestBook
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct ReviewGuestBook: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.ReviewGuestBook.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.BookingNoticeTime
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct BookingNoticeTime: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.BookingNoticeTime.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.MaxDaysNotice
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct MaxDaysNotice: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.MaxDaysNotice.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.MinNight
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct MinNight: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.MinNight.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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

        /// GetListingSettings.Results.MaxNight
        ///
        /// Parent Type: `ListingSettingsTypes`
        public struct MaxNight: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
          public static var __selections: [Apollo.Selection] { [
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

          /// GetListingSettings.Results.MaxNight.ListSetting
          ///
          /// Parent Type: `ListingSettings`
          public struct ListSetting: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
            public static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
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
    }
  }
}
