// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetAllReservationQuery: GraphQLQuery {
    static let operationName: String = "getAllReservation"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getAllReservation($userType: String, $currentPage: Int, $dateFilter: String) { getAllReservation( userType: $userType currentPage: $currentPage dateFilter: $dateFilter ) { __typename result { __typename id listId hostId guestId checkIn checkOut nights guests guestServiceFee hostServiceFee reservationState total currency cancellationPolicy messageData { __typename id } listData { __typename id title street city state country zipcode reviewsCount reviewsStarRating roomType bookingType wishListStatus listPhotoName listPhotos { __typename id name } listingData { __typename currency basePrice checkInStart checkInEnd } settingsData { __typename id listsettings { __typename id itemName } } } hostData { __typename profileId displayName picture firstName phoneNumber fullPhoneNumber userId userData { __typename email } } guestData { __typename profileId displayName picture phoneNumber fullPhoneNumber firstName userId userData { __typename email } } hostUser { __typename email } guestUser { __typename email } } count status errorMessage } }"#
      ))

    public var userType: GraphQLNullable<String>
    public var currentPage: GraphQLNullable<Int>
    public var dateFilter: GraphQLNullable<String>

    public init(
      userType: GraphQLNullable<String>,
      currentPage: GraphQLNullable<Int>,
      dateFilter: GraphQLNullable<String>
    ) {
      self.userType = userType
      self.currentPage = currentPage
      self.dateFilter = dateFilter
    }

    public var __variables: Variables? { [
      "userType": userType,
      "currentPage": currentPage,
      "dateFilter": dateFilter
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getAllReservation", GetAllReservation?.self, arguments: [
          "userType": .variable("userType"),
          "currentPage": .variable("currentPage"),
          "dateFilter": .variable("dateFilter")
        ]),
      ] }

      var getAllReservation: GetAllReservation? { __data["getAllReservation"] }

      /// GetAllReservation
      ///
      /// Parent Type: `AllReservation`
      struct GetAllReservation: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllReservation }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", [Result?]?.self),
          .field("count", Int?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: [Result?]? { __data["result"] }
        var count: Int? { __data["count"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetAllReservation.Result
        ///
        /// Parent Type: `Reservation`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Reservation }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("hostId", String?.self),
            .field("guestId", String?.self),
            .field("checkIn", String?.self),
            .field("checkOut", String?.self),
            .field("nights", Int?.self),
            .field("guests", Int?.self),
            .field("guestServiceFee", Double?.self),
            .field("hostServiceFee", Double?.self),
            .field("reservationState", String?.self),
            .field("total", Double?.self),
            .field("currency", String?.self),
            .field("cancellationPolicy", Int?.self),
            .field("messageData", MessageData?.self),
            .field("listData", ListData?.self),
            .field("hostData", HostData?.self),
            .field("guestData", GuestData?.self),
            .field("hostUser", HostUser?.self),
            .field("guestUser", GuestUser?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var hostId: String? { __data["hostId"] }
          var guestId: String? { __data["guestId"] }
          var checkIn: String? { __data["checkIn"] }
          var checkOut: String? { __data["checkOut"] }
          var nights: Int? { __data["nights"] }
          var guests: Int? { __data["guests"] }
          var guestServiceFee: Double? { __data["guestServiceFee"] }
          var hostServiceFee: Double? { __data["hostServiceFee"] }
          var reservationState: String? { __data["reservationState"] }
          var total: Double? { __data["total"] }
          var currency: String? { __data["currency"] }
          var cancellationPolicy: Int? { __data["cancellationPolicy"] }
          var messageData: MessageData? { __data["messageData"] }
          var listData: ListData? { __data["listData"] }
          var hostData: HostData? { __data["hostData"] }
          var guestData: GuestData? { __data["guestData"] }
          var hostUser: HostUser? { __data["hostUser"] }
          var guestUser: GuestUser? { __data["guestUser"] }

          /// GetAllReservation.Result.MessageData
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

          /// GetAllReservation.Result.ListData
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
              .field("listPhotos", [ListPhoto?]?.self),
              .field("listingData", ListingData?.self),
              .field("settingsData", [SettingsDatum?]?.self),
            ] }

            var id: Int? { __data["id"] }
            var title: String? { __data["title"] }
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
            var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
            var listingData: ListingData? { __data["listingData"] }
            var settingsData: [SettingsDatum?]? { __data["settingsData"] }

            /// GetAllReservation.Result.ListData.ListPhoto
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

            /// GetAllReservation.Result.ListData.ListingData
            ///
            /// Parent Type: `ListingData`
            struct ListingData: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("currency", String?.self),
                .field("basePrice", Double?.self),
                .field("checkInStart", String?.self),
                .field("checkInEnd", String?.self),
              ] }

              var currency: String? { __data["currency"] }
              var basePrice: Double? { __data["basePrice"] }
              var checkInStart: String? { __data["checkInStart"] }
              var checkInEnd: String? { __data["checkInEnd"] }
            }

            /// GetAllReservation.Result.ListData.SettingsDatum
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

              /// GetAllReservation.Result.ListData.SettingsDatum.Listsettings
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

          /// GetAllReservation.Result.HostData
          ///
          /// Parent Type: `UserProfile`
          struct HostData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("picture", String?.self),
              .field("firstName", String?.self),
              .field("phoneNumber", String?.self),
              .field("fullPhoneNumber", String?.self),
              .field("userId", String?.self),
              .field("userData", UserData?.self),
            ] }

            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var picture: String? { __data["picture"] }
            var firstName: String? { __data["firstName"] }
            var phoneNumber: String? { __data["phoneNumber"] }
            var fullPhoneNumber: String? { __data["fullPhoneNumber"] }
            var userId: String? { __data["userId"] }
            var userData: UserData? { __data["userData"] }

            /// GetAllReservation.Result.HostData.UserData
            ///
            /// Parent Type: `UserType`
            struct UserData: PTProAPI.SelectionSet {
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

          /// GetAllReservation.Result.GuestData
          ///
          /// Parent Type: `UserProfile`
          struct GuestData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("picture", String?.self),
              .field("phoneNumber", String?.self),
              .field("fullPhoneNumber", String?.self),
              .field("firstName", String?.self),
              .field("userId", String?.self),
              .field("userData", UserData?.self),
            ] }

            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var picture: String? { __data["picture"] }
            var phoneNumber: String? { __data["phoneNumber"] }
            var fullPhoneNumber: String? { __data["fullPhoneNumber"] }
            var firstName: String? { __data["firstName"] }
            var userId: String? { __data["userId"] }
            var userData: UserData? { __data["userData"] }

            /// GetAllReservation.Result.GuestData.UserData
            ///
            /// Parent Type: `UserType`
            struct UserData: PTProAPI.SelectionSet {
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

          /// GetAllReservation.Result.HostUser
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

          /// GetAllReservation.Result.GuestUser
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