// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetListingDetailsStep3Query: GraphQLQuery {
    static let operationName: String = "GetListingDetailsStep3"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query GetListingDetailsStep3($listId: String!, $preview: Boolean) { getListingDetails(listId: $listId, preview: $preview) { __typename status errorMessage results { __typename id userId bookingType isPublished houseRules { __typename id } listingData { __typename bookingNoticeTime checkInStart checkInEnd maxDaysNotice minNight maxNight basePrice cleaningPrice currency is_affiliate affiliate_commission weeklyDiscount monthlyDiscount cancellationPolicy } blockedDates { __typename blockedDates reservationId } calendars { __typename id name url listId status } } } }"#
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
            .field("bookingType", String?.self),
            .field("isPublished", Bool?.self),
            .field("houseRules", [HouseRule?]?.self),
            .field("listingData", ListingData?.self),
            .field("blockedDates", [BlockedDate?]?.self),
            .field("calendars", [Calendar?]?.self),
          ] }

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var bookingType: String? { __data["bookingType"] }
          var isPublished: Bool? { __data["isPublished"] }
          var houseRules: [HouseRule?]? { __data["houseRules"] }
          var listingData: ListingData? { __data["listingData"] }
          var blockedDates: [BlockedDate?]? { __data["blockedDates"] }
          var calendars: [Calendar?]? { __data["calendars"] }

          /// GetListingDetails.Results.HouseRule
          ///
          /// Parent Type: `AllListSettingTypes`
          struct HouseRule: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
            ] }

            var id: Int? { __data["id"] }
          }

          /// GetListingDetails.Results.ListingData
          ///
          /// Parent Type: `ListingData`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("bookingNoticeTime", String?.self),
              .field("checkInStart", String?.self),
              .field("checkInEnd", String?.self),
              .field("maxDaysNotice", String?.self),
              .field("minNight", Int?.self),
              .field("maxNight", Int?.self),
              .field("basePrice", Double?.self),
              .field("cleaningPrice", Double?.self),
              .field("currency", String?.self),
              .field("is_affiliate", Int?.self),
              .field("affiliate_commission", Double?.self),
              .field("weeklyDiscount", Int?.self),
              .field("monthlyDiscount", Int?.self),
              .field("cancellationPolicy", Int?.self),
            ] }

            var bookingNoticeTime: String? { __data["bookingNoticeTime"] }
            var checkInStart: String? { __data["checkInStart"] }
            var checkInEnd: String? { __data["checkInEnd"] }
            var maxDaysNotice: String? { __data["maxDaysNotice"] }
            var minNight: Int? { __data["minNight"] }
            var maxNight: Int? { __data["maxNight"] }
            var basePrice: Double? { __data["basePrice"] }
            var cleaningPrice: Double? { __data["cleaningPrice"] }
            var currency: String? { __data["currency"] }
            var is_affiliate: Int? { __data["is_affiliate"] }
            var affiliate_commission: Double? { __data["affiliate_commission"] }
            var weeklyDiscount: Int? { __data["weeklyDiscount"] }
            var monthlyDiscount: Int? { __data["monthlyDiscount"] }
            var cancellationPolicy: Int? { __data["cancellationPolicy"] }
          }

          /// GetListingDetails.Results.BlockedDate
          ///
          /// Parent Type: `ListBlockedDates`
          struct BlockedDate: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("blockedDates", String?.self),
              .field("reservationId", Int?.self),
            ] }

            var blockedDates: String? { __data["blockedDates"] }
            var reservationId: Int? { __data["reservationId"] }
          }

          /// GetListingDetails.Results.Calendar
          ///
          /// Parent Type: `ListCalendar`
          struct Calendar: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListCalendar }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("name", String?.self),
              .field("url", String?.self),
              .field("listId", Int.self),
              .field("status", String?.self),
            ] }

            var id: Int { __data["id"] }
            var name: String? { __data["name"] }
            var url: String? { __data["url"] }
            var listId: Int { __data["listId"] }
            var status: String? { __data["status"] }
          }
        }
      }
    }
  }

}