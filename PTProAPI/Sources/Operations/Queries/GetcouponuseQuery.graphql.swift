// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetcouponuseQuery: GraphQLQuery {
  public static let operationName: String = "getcouponuse"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getcouponuse($userId: String, $couponCode: String, $listId: Int) { getcouponuse(userId: $userId, couponCode: $couponCode, listId: $listId) { __typename errorMessage status } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var couponCode: GraphQLNullable<String>
  public var listId: GraphQLNullable<Int>

  public init(
    userId: GraphQLNullable<String>,
    couponCode: GraphQLNullable<String>,
    listId: GraphQLNullable<Int>
  ) {
    self.userId = userId
    self.couponCode = couponCode
    self.listId = listId
  }

  public var __variables: Variables? { [
    "userId": userId,
    "couponCode": couponCode,
    "listId": listId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getcouponuse", Getcouponuse?.self, arguments: [
        "userId": .variable("userId"),
        "couponCode": .variable("couponCode"),
        "listId": .variable("listId")
      ]),
    ] }

    public var getcouponuse: Getcouponuse? { __data["getcouponuse"] }

    /// Getcouponuse
    ///
    /// Parent Type: `Couponmanager`
    public struct Getcouponuse: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Couponmanager }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("errorMessage", String?.self),
        .field("status", Int?.self),
      ] }

      public var errorMessage: String? { __data["errorMessage"] }
      public var status: Int? { __data["status"] }
    }
  }
}
