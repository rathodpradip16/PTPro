// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UpdateSpecialPriceMutation: GraphQLMutation {
    static let operationName: String = "UpdateSpecialPrice"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation UpdateSpecialPrice($listId: Int!, $blockedDates: [String], $calendarStatus: String, $isSpecialPrice: Float) { UpdateSpecialPrice( listId: $listId blockedDates: $blockedDates calendarStatus: $calendarStatus isSpecialPrice: $isSpecialPrice ) { __typename status errorMessage } }"#
      ))

    public var listId: Int
    public var blockedDates: GraphQLNullable<[String?]>
    public var calendarStatus: GraphQLNullable<String>
    public var isSpecialPrice: GraphQLNullable<Double>

    public init(
      listId: Int,
      blockedDates: GraphQLNullable<[String?]>,
      calendarStatus: GraphQLNullable<String>,
      isSpecialPrice: GraphQLNullable<Double>
    ) {
      self.listId = listId
      self.blockedDates = blockedDates
      self.calendarStatus = calendarStatus
      self.isSpecialPrice = isSpecialPrice
    }

    public var __variables: Variables? { [
      "listId": listId,
      "blockedDates": blockedDates,
      "calendarStatus": calendarStatus,
      "isSpecialPrice": isSpecialPrice
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("UpdateSpecialPrice", UpdateSpecialPrice?.self, arguments: [
          "listId": .variable("listId"),
          "blockedDates": .variable("blockedDates"),
          "calendarStatus": .variable("calendarStatus"),
          "isSpecialPrice": .variable("isSpecialPrice")
        ]),
      ] }

      var updateSpecialPrice: UpdateSpecialPrice? { __data["UpdateSpecialPrice"] }

      /// UpdateSpecialPrice
      ///
      /// Parent Type: `ListBlockedDatesResponseType`
      struct UpdateSpecialPrice: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListBlockedDatesResponseType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}