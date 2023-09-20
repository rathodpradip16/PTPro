// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreatecouponcodeMutation: GraphQLMutation {
  public static let operationName: String = "Createcouponcode"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Createcouponcode($userId: String, $listId: Int, $couponCode: String, $couponType: String, $discount: Float, $startDate: String, $endDate: String, $description: String, $userType: String) { Createcouponcode( userId: $userId listId: $listId couponCode: $couponCode couponType: $couponType discount: $discount startDate: $startDate endDate: $endDate description: $description userType: $userType ) { __typename status } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var listId: GraphQLNullable<Int>
  public var couponCode: GraphQLNullable<String>
  public var couponType: GraphQLNullable<String>
  public var discount: GraphQLNullable<Double>
  public var startDate: GraphQLNullable<String>
  public var endDate: GraphQLNullable<String>
  public var description: GraphQLNullable<String>
  public var userType: GraphQLNullable<String>

  public init(
    userId: GraphQLNullable<String>,
    listId: GraphQLNullable<Int>,
    couponCode: GraphQLNullable<String>,
    couponType: GraphQLNullable<String>,
    discount: GraphQLNullable<Double>,
    startDate: GraphQLNullable<String>,
    endDate: GraphQLNullable<String>,
    description: GraphQLNullable<String>,
    userType: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.listId = listId
    self.couponCode = couponCode
    self.couponType = couponType
    self.discount = discount
    self.startDate = startDate
    self.endDate = endDate
    self.description = description
    self.userType = userType
  }

  public var __variables: Variables? { [
    "userId": userId,
    "listId": listId,
    "couponCode": couponCode,
    "couponType": couponType,
    "discount": discount,
    "startDate": startDate,
    "endDate": endDate,
    "description": description,
    "userType": userType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Createcouponcode", Createcouponcode?.self, arguments: [
        "userId": .variable("userId"),
        "listId": .variable("listId"),
        "couponCode": .variable("couponCode"),
        "couponType": .variable("couponType"),
        "discount": .variable("discount"),
        "startDate": .variable("startDate"),
        "endDate": .variable("endDate"),
        "description": .variable("description"),
        "userType": .variable("userType")
      ]),
    ] }

    public var createcouponcode: Createcouponcode? { __data["Createcouponcode"] }

    /// Createcouponcode
    ///
    /// Parent Type: `Couponmanager`
    public struct Createcouponcode: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Couponmanager }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
      ] }

      public var status: Int? { __data["status"] }
    }
  }
}
