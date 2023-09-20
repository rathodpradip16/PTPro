// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateCoupenEntryMutation: GraphQLMutation {
  public static let operationName: String = "CreateCoupenEntry"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateCoupenEntry($userId: String, $couponCode: String) { CreateCoupenEntry(userId: $userId, couponCode: $couponCode) { __typename status } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var couponCode: GraphQLNullable<String>

  public init(
    userId: GraphQLNullable<String>,
    couponCode: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.couponCode = couponCode
  }

  public var __variables: Variables? { [
    "userId": userId,
    "couponCode": couponCode
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("CreateCoupenEntry", CreateCoupenEntry?.self, arguments: [
        "userId": .variable("userId"),
        "couponCode": .variable("couponCode")
      ]),
    ] }

    public var createCoupenEntry: CreateCoupenEntry? { __data["CreateCoupenEntry"] }

    /// CreateCoupenEntry
    ///
    /// Parent Type: `Couponmanager`
    public struct CreateCoupenEntry: PTProAPI.SelectionSet {
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
