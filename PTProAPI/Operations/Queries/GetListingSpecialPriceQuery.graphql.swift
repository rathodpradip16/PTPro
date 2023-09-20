// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetListingSpecialPriceQuery: GraphQLQuery {
  public static let operationName: String = "getListingSpecialPrice"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getListingSpecialPrice($listId: Int!) { getListingSpecialPrice(listId: $listId) { __typename results { __typename id listId reservationId blockedDates calendarStatus isSpecialPrice listCurrency } status errorMessage } }"#
    ))

  public var listId: Int

  public init(listId: Int) {
    self.listId = listId
  }

  public var __variables: Variables? { ["listId": listId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getListingSpecialPrice", GetListingSpecialPrice?.self, arguments: ["listId": .variable("listId")]),
    ] }

    public var getListingSpecialPrice: GetListingSpecialPrice? { __data["getListingSpecialPrice"] }

    /// GetListingSpecialPrice
    ///
    /// Parent Type: `ListBlockedDatesResponseType`
    public struct GetListingSpecialPrice: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDatesResponseType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetListingSpecialPrice.Result
      ///
      /// Parent Type: `ListBlockedDates`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("listId", Int?.self),
          .field("reservationId", Int?.self),
          .field("blockedDates", String?.self),
          .field("calendarStatus", String?.self),
          .field("isSpecialPrice", Double?.self),
          .field("listCurrency", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var reservationId: Int? { __data["reservationId"] }
        public var blockedDates: String? { __data["blockedDates"] }
        public var calendarStatus: String? { __data["calendarStatus"] }
        public var isSpecialPrice: Double? { __data["isSpecialPrice"] }
        public var listCurrency: String? { __data["listCurrency"] }
      }
    }
  }
}
