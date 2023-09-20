// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetListingDetailsStep3Query: GraphQLQuery {
  public static let operationName: String = "GetListingDetailsStep3"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query GetListingDetailsStep3($listId: String!, $preview: Boolean) { getListingDetails(listId: $listId, preview: $preview) { __typename results { __typename id userId bookingType isPublished houseRules { __typename id } listingData { __typename bookingNoticeTime checkInStart checkInEnd maxDaysNotice minNight maxNight basePrice cleaningPrice currency weeklyDiscount monthlyDiscount cancellationPolicy } blockedDates { __typename blockedDates reservationId } calendars { __typename id name url listId status } } status errorMessage } }"#
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
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

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
          .field("bookingType", String?.self),
          .field("isPublished", Bool?.self),
          .field("houseRules", [HouseRule?]?.self),
          .field("listingData", ListingData?.self),
          .field("blockedDates", [BlockedDate?]?.self),
          .field("calendars", [Calendar?]?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var userId: String? { __data["userId"] }
        public var bookingType: String? { __data["bookingType"] }
        public var isPublished: Bool? { __data["isPublished"] }
        public var houseRules: [HouseRule?]? { __data["houseRules"] }
        public var listingData: ListingData? { __data["listingData"] }
        public var blockedDates: [BlockedDate?]? { __data["blockedDates"] }
        public var calendars: [Calendar?]? { __data["calendars"] }

        /// GetListingDetails.Results.HouseRule
        ///
        /// Parent Type: `AllListSettingTypes`
        public struct HouseRule: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListSettingTypes }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
          ] }

          public var id: Int? { __data["id"] }
        }

        /// GetListingDetails.Results.ListingData
        ///
        /// Parent Type: `ListingData`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingData }
          public static var __selections: [Apollo.Selection] { [
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
            .field("weeklyDiscount", Int?.self),
            .field("monthlyDiscount", Int?.self),
            .field("cancellationPolicy", Int?.self),
          ] }

          public var bookingNoticeTime: String? { __data["bookingNoticeTime"] }
          public var checkInStart: String? { __data["checkInStart"] }
          public var checkInEnd: String? { __data["checkInEnd"] }
          public var maxDaysNotice: String? { __data["maxDaysNotice"] }
          public var minNight: Int? { __data["minNight"] }
          public var maxNight: Int? { __data["maxNight"] }
          public var basePrice: Double? { __data["basePrice"] }
          public var cleaningPrice: Double? { __data["cleaningPrice"] }
          public var currency: String? { __data["currency"] }
          public var weeklyDiscount: Int? { __data["weeklyDiscount"] }
          public var monthlyDiscount: Int? { __data["monthlyDiscount"] }
          public var cancellationPolicy: Int? { __data["cancellationPolicy"] }
        }

        /// GetListingDetails.Results.BlockedDate
        ///
        /// Parent Type: `ListBlockedDates`
        public struct BlockedDate: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("blockedDates", String?.self),
            .field("reservationId", Int?.self),
          ] }

          public var blockedDates: String? { __data["blockedDates"] }
          public var reservationId: Int? { __data["reservationId"] }
        }

        /// GetListingDetails.Results.Calendar
        ///
        /// Parent Type: `ListCalendar`
        public struct Calendar: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListCalendar }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String?.self),
            .field("url", String?.self),
            .field("listId", Int.self),
            .field("status", String?.self),
          ] }

          public var id: Int { __data["id"] }
          public var name: String? { __data["name"] }
          public var url: String? { __data["url"] }
          public var listId: Int { __data["listId"] }
          public var status: String? { __data["status"] }
        }
      }
    }
  }
}
