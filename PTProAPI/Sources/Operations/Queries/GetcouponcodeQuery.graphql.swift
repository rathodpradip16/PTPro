// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetcouponcodeQuery: GraphQLQuery {
  public static let operationName: String = "getcouponcode"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getcouponcode($userId: String, $couponType: String, $listId: Int, $subscriptionType: String) { getcouponcode( userId: $userId couponType: $couponType listId: $listId subscriptionType: $subscriptionType ) { __typename errorMessage status data { __typename id couponCode activeStatus couponType discount startDate endDate description userType } } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var couponType: GraphQLNullable<String>
  public var listId: GraphQLNullable<Int>
  public var subscriptionType: GraphQLNullable<String>

  public init(
    userId: GraphQLNullable<String>,
    couponType: GraphQLNullable<String>,
    listId: GraphQLNullable<Int>,
    subscriptionType: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.couponType = couponType
    self.listId = listId
    self.subscriptionType = subscriptionType
  }

  public var __variables: Variables? { [
    "userId": userId,
    "couponType": couponType,
    "listId": listId,
    "subscriptionType": subscriptionType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getcouponcode", Getcouponcode?.self, arguments: [
        "userId": .variable("userId"),
        "couponType": .variable("couponType"),
        "listId": .variable("listId"),
        "subscriptionType": .variable("subscriptionType")
      ]),
    ] }

    public var getcouponcode: Getcouponcode? { __data["getcouponcode"] }

    /// Getcouponcode
    ///
    /// Parent Type: `Couponmanager`
    public struct Getcouponcode: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Couponmanager }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("errorMessage", String?.self),
        .field("status", Int?.self),
        .field("data", [Datum?]?.self),
      ] }

      public var errorMessage: String? { __data["errorMessage"] }
      public var status: Int? { __data["status"] }
      public var data: [Datum?]? { __data["data"] }

      /// Getcouponcode.Datum
      ///
      /// Parent Type: `Getcoupon`
      public struct Datum: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Getcoupon }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("couponCode", String?.self),
          .field("activeStatus", String?.self),
          .field("couponType", String?.self),
          .field("discount", Double?.self),
          .field("startDate", String?.self),
          .field("endDate", String?.self),
          .field("description", String?.self),
          .field("userType", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var couponCode: String? { __data["couponCode"] }
        public var activeStatus: String? { __data["activeStatus"] }
        public var couponType: String? { __data["couponType"] }
        public var discount: Double? { __data["discount"] }
        public var startDate: String? { __data["startDate"] }
        public var endDate: String? { __data["endDate"] }
        public var description: String? { __data["description"] }
        public var userType: String? { __data["userType"] }
      }
    }
  }
}
