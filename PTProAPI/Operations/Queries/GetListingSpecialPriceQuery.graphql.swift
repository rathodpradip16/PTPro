// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetListingSpecialPriceQuery: GraphQLQuery {
    static let operationName: String = "getListingSpecialPrice"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getListingSpecialPrice($listId: Int!) { getListingSpecialPrice(listId: $listId) { __typename results { __typename id listId reservationId blockedDates calendarStatus isSpecialPrice listCurrency } status errorMessage } }"#
      ))

    public var listId: Int

    public init(listId: Int) {
      self.listId = listId
    }

    public var __variables: Variables? { ["listId": listId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getListingSpecialPrice", GetListingSpecialPrice?.self, arguments: ["listId": .variable("listId")]),
      ] }

      var getListingSpecialPrice: GetListingSpecialPrice? { __data["getListingSpecialPrice"] }

      /// GetListingSpecialPrice
      ///
      /// Parent Type: `ListBlockedDatesResponseType`
      struct GetListingSpecialPrice: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDatesResponseType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetListingSpecialPrice.Result
        ///
        /// Parent Type: `ListBlockedDates`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDates }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("reservationId", Int?.self),
            .field("blockedDates", String?.self),
            .field("calendarStatus", String?.self),
            .field("isSpecialPrice", Double?.self),
            .field("listCurrency", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var reservationId: Int? { __data["reservationId"] }
          var blockedDates: String? { __data["blockedDates"] }
          var calendarStatus: String? { __data["calendarStatus"] }
          var isSpecialPrice: Double? { __data["isSpecialPrice"] }
          var listCurrency: String? { __data["listCurrency"] }
        }
      }
    }
  }

}