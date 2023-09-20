// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetListingSettingQuery: GraphQLQuery {
    static let operationName: String = "getListingSetting"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getListingSetting { getListingSettings { __typename status results { __typename roomType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable image } } personCapacity { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } houseType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } buildingSize { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bedrooms { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } beds { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bedType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bathrooms { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bathroomType { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } amenities { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id image typeId itemName otherItemName maximum minimum startValue endValue isEnable } } safetyAmenities { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id image typeId itemName otherItemName maximum minimum startValue endValue isEnable } } spaces { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } guestRequirements { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } houseRules { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } reviewGuestBook { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } bookingNoticeTime { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } maxDaysNotice { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } minNight { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } maxNight { __typename id typeName fieldType typeLabel step isEnable listSettings { __typename id typeId itemName otherItemName maximum minimum startValue endValue isEnable } } } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getListingSettings", GetListingSettings?.self),
      ] }

      var getListingSettings: GetListingSettings? { __data["getListingSettings"] }

      /// GetListingSettings
      ///
      /// Parent Type: `ListingSettingsCommonTypes`
      struct GetListingSettings: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsCommonTypes }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var results: Results? { __data["results"] }

        /// GetListingSettings.Results
        ///
        /// Parent Type: `SettingsType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.SettingsType }
          static var __selections: [Apollo.Selection] { [
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

          var roomType: RoomType? { __data["roomType"] }
          var personCapacity: PersonCapacity? { __data["personCapacity"] }
          var houseType: HouseType? { __data["houseType"] }
          var buildingSize: BuildingSize? { __data["buildingSize"] }
          var bedrooms: Bedrooms? { __data["bedrooms"] }
          var beds: Beds? { __data["beds"] }
          var bedType: BedType? { __data["bedType"] }
          var bathrooms: Bathrooms? { __data["bathrooms"] }
          var bathroomType: BathroomType? { __data["bathroomType"] }
          var amenities: Amenities? { __data["amenities"] }
          var safetyAmenities: SafetyAmenities? { __data["safetyAmenities"] }
          var spaces: Spaces? { __data["spaces"] }
          var guestRequirements: GuestRequirements? { __data["guestRequirements"] }
          var houseRules: HouseRules? { __data["houseRules"] }
          var reviewGuestBook: ReviewGuestBook? { __data["reviewGuestBook"] }
          var bookingNoticeTime: BookingNoticeTime? { __data["bookingNoticeTime"] }
          var maxDaysNotice: MaxDaysNotice? { __data["maxDaysNotice"] }
          var minNight: MinNight? { __data["minNight"] }
          var maxNight: MaxNight? { __data["maxNight"] }

          /// GetListingSettings.Results.RoomType
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct RoomType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.RoomType.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
              var typeId: Int? { __data["typeId"] }
              var itemName: String? { __data["itemName"] }
              var otherItemName: String? { __data["otherItemName"] }
              var maximum: Int? { __data["maximum"] }
              var minimum: Int? { __data["minimum"] }
              var startValue: Int? { __data["startValue"] }
              var endValue: Int? { __data["endValue"] }
              var isEnable: String? { __data["isEnable"] }
              var image: String? { __data["image"] }
            }
          }

          /// GetListingSettings.Results.PersonCapacity
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct PersonCapacity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.PersonCapacity.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.HouseType
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct HouseType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.HouseType.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.BuildingSize
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct BuildingSize: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.BuildingSize.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.Bedrooms
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct Bedrooms: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.Bedrooms.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.Beds
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct Beds: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.Beds.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.BedType
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct BedType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.BedType.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.Bathrooms
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct Bathrooms: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.Bathrooms.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.BathroomType
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct BathroomType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.BathroomType.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.Amenities
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct Amenities: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.Amenities.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
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

          /// GetListingSettings.Results.SafetyAmenities
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct SafetyAmenities: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.SafetyAmenities.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
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

          /// GetListingSettings.Results.Spaces
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct Spaces: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.Spaces.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.GuestRequirements
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct GuestRequirements: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.GuestRequirements.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.HouseRules
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct HouseRules: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.HouseRules.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.ReviewGuestBook
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct ReviewGuestBook: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.ReviewGuestBook.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.BookingNoticeTime
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct BookingNoticeTime: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.BookingNoticeTime.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.MaxDaysNotice
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct MaxDaysNotice: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.MaxDaysNotice.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.MinNight
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct MinNight: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.MinNight.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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

          /// GetListingSettings.Results.MaxNight
          ///
          /// Parent Type: `ListingSettingsTypes`
          struct MaxNight: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettingsTypes }
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

            /// GetListingSettings.Results.MaxNight.ListSetting
            ///
            /// Parent Type: `ListingSettings`
            struct ListSetting: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingSettings }
              static var __selections: [Apollo.Selection] { [
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

              var id: Int? { __data["id"] }
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
      }
    }
  }

}