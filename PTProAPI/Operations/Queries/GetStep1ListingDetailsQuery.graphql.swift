// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetStep1ListingDetailsQuery: GraphQLQuery {
    static let operationName: String = "getStep1ListingDetails"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getStep1ListingDetails($listId: String!, $preview: Boolean) { getListingDetails(listId: $listId, preview: $preview) { __typename status errorMessage results { __typename id userId country street buildingName city state zipcode lat lng isMapTouched bedrooms residenceType beds personCapacity bathrooms user { __typename email userBanStatus profile { __typename firstName lastName dateOfBirth } } userAmenities { __typename id itemName } userSafetyAmenities { __typename id itemName } userSpaces { __typename id itemName } settingsData { __typename id settingsId listsettings { __typename id itemName settingsType { __typename typeName } } } userBedsTypes { __typename id listId bedCount bedType } } } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getListingDetails", GetListingDetails?.self, arguments: [
          "listId": .variable("listId"),
          "preview": .variable("preview")
        ]),
      ] }

      var getListingDetails: GetListingDetails? { __data["getListingDetails"] }

      /// GetListingDetails
      ///
      /// Parent Type: `AllListing`
      struct GetListingDetails: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListing }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// GetListingDetails.Results
        ///
        /// Parent Type: `ShowListing`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          static var __selections: [Apollo.Selection] { [
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

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var country: String? { __data["country"] }
          var street: String? { __data["street"] }
          var buildingName: String? { __data["buildingName"] }
          var city: String? { __data["city"] }
          var state: String? { __data["state"] }
          var zipcode: String? { __data["zipcode"] }
          var lat: Double? { __data["lat"] }
          var lng: Double? { __data["lng"] }
          var isMapTouched: Bool? { __data["isMapTouched"] }
          var bedrooms: String? { __data["bedrooms"] }
          var residenceType: String? { __data["residenceType"] }
          var beds: Int? { __data["beds"] }
          var personCapacity: Int? { __data["personCapacity"] }
          var bathrooms: Double? { __data["bathrooms"] }
          var user: User? { __data["user"] }
          var userAmenities: [UserAmenity?]? { __data["userAmenities"] }
          var userSafetyAmenities: [UserSafetyAmenity?]? { __data["userSafetyAmenities"] }
          var userSpaces: [UserSpace?]? { __data["userSpaces"] }
          var settingsData: [SettingsDatum?]? { __data["settingsData"] }
          var userBedsTypes: [UserBedsType?]? { __data["userBedsTypes"] }

          /// GetListingDetails.Results.User
          ///
          /// Parent Type: `User`
          struct User: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.User }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("email", String?.self),
              .field("userBanStatus", Int?.self),
              .field("profile", Profile?.self),
            ] }

            var email: String? { __data["email"] }
            var userBanStatus: Int? { __data["userBanStatus"] }
            var profile: Profile? { __data["profile"] }

            /// GetListingDetails.Results.User.Profile
            ///
            /// Parent Type: `Profile`
            struct Profile: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Profile }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("firstName", String?.self),
                .field("lastName", String?.self),
                .field("dateOfBirth", String?.self),
              ] }

              var firstName: String? { __data["firstName"] }
              var lastName: String? { __data["lastName"] }
              var dateOfBirth: String? { __data["dateOfBirth"] }
            }
          }

          /// GetListingDetails.Results.UserAmenity
          ///
          /// Parent Type: `AllListSettingTypes`
          struct UserAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var itemName: String? { __data["itemName"] }
          }

          /// GetListingDetails.Results.UserSafetyAmenity
          ///
          /// Parent Type: `AllListSettingTypes`
          struct UserSafetyAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var itemName: String? { __data["itemName"] }
          }

          /// GetListingDetails.Results.UserSpace
          ///
          /// Parent Type: `AllListSettingTypes`
          struct UserSpace: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("itemName", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var itemName: String? { __data["itemName"] }
          }

          /// GetListingDetails.Results.SettingsDatum
          ///
          /// Parent Type: `UserListingData`
          struct SettingsDatum: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("settingsId", Int?.self),
              .field("listsettings", Listsettings?.self),
            ] }

            var id: Int? { __data["id"] }
            var settingsId: Int? { __data["settingsId"] }
            var listsettings: Listsettings? { __data["listsettings"] }

            /// GetListingDetails.Results.SettingsDatum.Listsettings
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
                .field("settingsType", SettingsType?.self),
              ] }

              var id: Int? { __data["id"] }
              var itemName: String? { __data["itemName"] }
              var settingsType: SettingsType? { __data["settingsType"] }

              /// GetListingDetails.Results.SettingsDatum.Listsettings.SettingsType
              ///
              /// Parent Type: `ListSettingsTypes`
              struct SettingsType: PTProAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListSettingsTypes }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("typeName", String?.self),
                ] }

                var typeName: String? { __data["typeName"] }
              }
            }
          }

          /// GetListingDetails.Results.UserBedsType
          ///
          /// Parent Type: `BedTypes`
          struct UserBedsType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.BedTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("listId", Int?.self),
              .field("bedCount", Int?.self),
              .field("bedType", Int?.self),
            ] }

            var id: Int? { __data["id"] }
            var listId: Int? { __data["listId"] }
            var bedCount: Int? { __data["bedCount"] }
            var bedType: Int? { __data["bedType"] }
          }
        }
      }
    }
  }

}