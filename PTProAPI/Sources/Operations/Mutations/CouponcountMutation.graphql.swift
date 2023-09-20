// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CouponcountMutation: GraphQLMutation {
  public static let operationName: String = "Couponcount"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Couponcount($id: Int!, $couponCode: String) { Couponcount(id: $id, couponCode: $couponCode) { __typename status errorMessage } }"#
    ))

  public var id: Int
  public var couponCode: GraphQLNullable<String>

  public init(
    id: Int,
    couponCode: GraphQLNullable<String>
  ) {
    self.id = id
    self.couponCode = couponCode
  }

  public var __variables: Variables? { [
    "id": id,
    "couponCode": couponCode
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Couponcount", Couponcount?.self, arguments: [
        "id": .variable("id"),
        "couponCode": .variable("couponCode")
      ]),
    ] }

    public var couponcount: Couponcount? { __data["Couponcount"] }

    /// Couponcount
    ///
    /// Parent Type: `Couponmanager`
    public struct Couponcount: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Couponmanager }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
