// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetReservationQuery: GraphQLQuery {
    static let operationName: String = "getReservation"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getReservation($reservationId: Int!, $convertCurrency: String) { getReservation(reservationId: $reservationId, convertCurrency: $convertCurrency) { __typename status errorMessage results { __typename id nights listId hostId guestId checkIn checkOut guests message basePrice cleaningPrice currency discount checkInStart checkInEnd discountType isSpecialPriceAverage guestServiceFee hostServiceFee total totalWithGuestServiceFee confirmationCode paymentState payoutId paymentMethodId reservationState createdAt updatedAt listData { __typename id title beds street city state country zipcode reviewsCount reviewsStarRating roomType bookingType wishListStatus listPhotoName isListOwner listPhotos { __typename id name } listingData { __typename checkInStart checkInEnd } settingsData { __typename id listsettings { __typename id itemName } } } messageData { __typename id } hostData { __typename userId profileId displayName firstName phoneNumber picture } guestData { __typename userId profileId displayName firstName phoneNumber picture } hostUser { __typename email } guestUser { __typename email } } convertedBasePrice convertedHostServiceFee convertedGuestServicefee convertedIsSpecialAverage convertedTotalNightsAmount convertTotalWithGuestServiceFee convertedTotalWithHostServiceFee convertedCleaningPrice convertedDiscount } }"#
      ))

    public var reservationId: Int
    public var convertCurrency: GraphQLNullable<String>

    public init(
      reservationId: Int,
      convertCurrency: GraphQLNullable<String>
    ) {
      self.reservationId = reservationId
      self.convertCurrency = convertCurrency
    }

    public var __variables: Variables? { [
      "reservationId": reservationId,
      "convertCurrency": convertCurrency
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getReservation", GetReservation?.self, arguments: [
          "reservationId": .variable("reservationId"),
          "convertCurrency": .variable("convertCurrency")
        ]),
      ] }

      var getReservation: GetReservation? { __data["getReservation"] }

      /// GetReservation
      ///
      /// Parent Type: `Reservationlist`
      struct GetReservation: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservationlist }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
          .field("convertedBasePrice", Double?.self),
          .field("convertedHostServiceFee", Double?.self),
          .field("convertedGuestServicefee", Double?.self),
          .field("convertedIsSpecialAverage", Double?.self),
          .field("convertedTotalNightsAmount", Double?.self),
          .field("convertTotalWithGuestServiceFee", Double?.self),
          .field("convertedTotalWithHostServiceFee", Double?.self),
          .field("convertedCleaningPrice", Double?.self),
          .field("convertedDiscount", Double?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }
        var convertedBasePrice: Double? { __data["convertedBasePrice"] }
        var convertedHostServiceFee: Double? { __data["convertedHostServiceFee"] }
        var convertedGuestServicefee: Double? { __data["convertedGuestServicefee"] }
        var convertedIsSpecialAverage: Double? { __data["convertedIsSpecialAverage"] }
        var convertedTotalNightsAmount: Double? { __data["convertedTotalNightsAmount"] }
        var convertTotalWithGuestServiceFee: Double? { __data["convertTotalWithGuestServiceFee"] }
        var convertedTotalWithHostServiceFee: Double? { __data["convertedTotalWithHostServiceFee"] }
        var convertedCleaningPrice: Double? { __data["convertedCleaningPrice"] }
        var convertedDiscount: Double? { __data["convertedDiscount"] }

        /// GetReservation.Results
        ///
        /// Parent Type: `Reservation`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("nights", Int?.self),
            .field("listId", Int?.self),
            .field("hostId", String?.self),
            .field("guestId", String?.self),
            .field("checkIn", String?.self),
            .field("checkOut", String?.self),
            .field("guests", Int?.self),
            .field("message", String?.self),
            .field("basePrice", Double?.self),
            .field("cleaningPrice", Double?.self),
            .field("currency", String?.self),
            .field("discount", Double?.self),
            .field("checkInStart", String?.self),
            .field("checkInEnd", String?.self),
            .field("discountType", String?.self),
            .field("isSpecialPriceAverage", Double?.self),
            .field("guestServiceFee", Double?.self),
            .field("hostServiceFee", Double?.self),
            .field("total", Double?.self),
            .field("totalWithGuestServiceFee", Double?.self),
            .field("confirmationCode", Int?.self),
            .field("paymentState", String?.self),
            .field("payoutId", Int?.self),
            .field("paymentMethodId", Int?.self),
            .field("reservationState", String?.self),
            .field("createdAt", String?.self),
            .field("updatedAt", String?.self),
            .field("listData", ListData?.self),
            .field("messageData", MessageData?.self),
            .field("hostData", HostData?.self),
            .field("guestData", GuestData?.self),
            .field("hostUser", HostUser?.self),
            .field("guestUser", GuestUser?.self),
          ] }

          var id: Int? { __data["id"] }
          var nights: Int? { __data["nights"] }
          var listId: Int? { __data["listId"] }
          var hostId: String? { __data["hostId"] }
          var guestId: String? { __data["guestId"] }
          var checkIn: String? { __data["checkIn"] }
          var checkOut: String? { __data["checkOut"] }
          var guests: Int? { __data["guests"] }
          var message: String? { __data["message"] }
          var basePrice: Double? { __data["basePrice"] }
          var cleaningPrice: Double? { __data["cleaningPrice"] }
          var currency: String? { __data["currency"] }
          var discount: Double? { __data["discount"] }
          var checkInStart: String? { __data["checkInStart"] }
          var checkInEnd: String? { __data["checkInEnd"] }
          var discountType: String? { __data["discountType"] }
          var isSpecialPriceAverage: Double? { __data["isSpecialPriceAverage"] }
          var guestServiceFee: Double? { __data["guestServiceFee"] }
          var hostServiceFee: Double? { __data["hostServiceFee"] }
          var total: Double? { __data["total"] }
          var totalWithGuestServiceFee: Double? { __data["totalWithGuestServiceFee"] }
          var confirmationCode: Int? { __data["confirmationCode"] }
          var paymentState: String? { __data["paymentState"] }
          var payoutId: Int? { __data["payoutId"] }
          var paymentMethodId: Int? { __data["paymentMethodId"] }
          var reservationState: String? { __data["reservationState"] }
          var createdAt: String? { __data["createdAt"] }
          var updatedAt: String? { __data["updatedAt"] }
          var listData: ListData? { __data["listData"] }
          var messageData: MessageData? { __data["messageData"] }
          var hostData: HostData? { __data["hostData"] }
          var guestData: GuestData? { __data["guestData"] }
          var hostUser: HostUser? { __data["hostUser"] }
          var guestUser: GuestUser? { __data["guestUser"] }

          /// GetReservation.Results.ListData
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
              .field("beds", Int?.self),
              .field("street", String?.self),
              .field("city", String?.self),
              .field("state", String?.self),
              .field("country", String?.self),
              .field("zipcode", String?.self),
              .field("reviewsCount", Int?.self),
              .field("reviewsStarRating", Int?.self),
              .field("roomType", String?.self),
              .field("bookingType", String?.self),
              .field("wishListStatus", Bool?.self),
              .field("listPhotoName", String?.self),
              .field("isListOwner", Bool?.self),
              .field("listPhotos", [ListPhoto?]?.self),
              .field("listingData", ListingData?.self),
              .field("settingsData", [SettingsDatum?]?.self),
            ] }

            var id: Int? { __data["id"] }
            var title: String? { __data["title"] }
            var beds: Int? { __data["beds"] }
            var street: String? { __data["street"] }
            var city: String? { __data["city"] }
            var state: String? { __data["state"] }
            var country: String? { __data["country"] }
            var zipcode: String? { __data["zipcode"] }
            var reviewsCount: Int? { __data["reviewsCount"] }
            var reviewsStarRating: Int? { __data["reviewsStarRating"] }
            var roomType: String? { __data["roomType"] }
            var bookingType: String? { __data["bookingType"] }
            var wishListStatus: Bool? { __data["wishListStatus"] }
            var listPhotoName: String? { __data["listPhotoName"] }
            var isListOwner: Bool? { __data["isListOwner"] }
            var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
            var listingData: ListingData? { __data["listingData"] }
            var settingsData: [SettingsDatum?]? { __data["settingsData"] }

            /// GetReservation.Results.ListData.ListPhoto
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

            /// GetReservation.Results.ListData.ListingData
            ///
            /// Parent Type: `ListingData`
            struct ListingData: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("checkInStart", String?.self),
                .field("checkInEnd", String?.self),
              ] }

              var checkInStart: String? { __data["checkInStart"] }
              var checkInEnd: String? { __data["checkInEnd"] }
            }

            /// GetReservation.Results.ListData.SettingsDatum
            ///
            /// Parent Type: `UserListingData`
            struct SettingsDatum: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserListingData }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", Int?.self),
                .field("listsettings", Listsettings?.self),
              ] }

              var id: Int? { __data["id"] }
              var listsettings: Listsettings? { __data["listsettings"] }

              /// GetReservation.Results.ListData.SettingsDatum.Listsettings
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

          /// GetReservation.Results.MessageData
          ///
          /// Parent Type: `Threads`
          struct MessageData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Threads }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
            ] }

            var id: Int? { __data["id"] }
          }

          /// GetReservation.Results.HostData
          ///
          /// Parent Type: `UserProfile`
          struct HostData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userId", String?.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("firstName", String?.self),
              .field("phoneNumber", String?.self),
              .field("picture", String?.self),
            ] }

            var userId: String? { __data["userId"] }
            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var firstName: String? { __data["firstName"] }
            var phoneNumber: String? { __data["phoneNumber"] }
            var picture: String? { __data["picture"] }
          }

          /// GetReservation.Results.GuestData
          ///
          /// Parent Type: `UserProfile`
          struct GuestData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userId", String?.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("firstName", String?.self),
              .field("phoneNumber", String?.self),
              .field("picture", String?.self),
            ] }

            var userId: String? { __data["userId"] }
            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var firstName: String? { __data["firstName"] }
            var phoneNumber: String? { __data["phoneNumber"] }
            var picture: String? { __data["picture"] }
          }

          /// GetReservation.Results.HostUser
          ///
          /// Parent Type: `UserType`
          struct HostUser: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("email", String?.self),
            ] }

            var email: String? { __data["email"] }
          }

          /// GetReservation.Results.GuestUser
          ///
          /// Parent Type: `UserType`
          struct GuestUser: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("email", String?.self),
            ] }

            var email: String? { __data["email"] }
          }
        }
      }
    }
  }

}