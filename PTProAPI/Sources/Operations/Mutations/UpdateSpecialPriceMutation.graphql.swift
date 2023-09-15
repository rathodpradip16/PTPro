// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateSpecialPriceMutation: GraphQLMutation {
  public static let operationName: String = "UpdateSpecialPrice"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation UpdateSpecialPrice($listId: Int!, $blockedDates: [String], $calendarStatus: String, $isSpecialPrice: Float) {
        UpdateSpecialPrice(
          listId: $listId
          blockedDates: $blockedDates
          calendarStatus: $calendarStatus
          isSpecialPrice: $isSpecialPrice
        ) {
          __typename
          status
          errorMessage
        }
      }
      """
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("UpdateSpecialPrice", UpdateSpecialPrice?.self, arguments: [
        "listId": .variable("listId"),
        "blockedDates": .variable("blockedDates"),
        "calendarStatus": .variable("calendarStatus"),
        "isSpecialPrice": .variable("isSpecialPrice")
      ]),
    ] }

    public var updateSpecialPrice: UpdateSpecialPrice? { __data["UpdateSpecialPrice"] }

    /// UpdateSpecialPrice
    ///
    /// Parent Type: `ListBlockedDatesResponseType`
    public struct UpdateSpecialPrice: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ListBlockedDatesResponseType }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
