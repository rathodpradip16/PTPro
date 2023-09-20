// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class CreateAffiliateLinkMutation: GraphQLMutation {
  public static let operationName: String = "createAffiliateLink"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation createAffiliateLink($propertyId: Int, $affiliateId: String) { createAffiliateLink(propertyId: $propertyId, affiliateId: $affiliateId) { __typename status errorMessage } }"#
    ))

  public var propertyId: GraphQLNullable<Int>
  public var affiliateId: GraphQLNullable<String>

  public init(
    propertyId: GraphQLNullable<Int>,
    affiliateId: GraphQLNullable<String>
  ) {
    self.propertyId = propertyId
    self.affiliateId = affiliateId
  }

  public var __variables: Variables? { [
    "propertyId": propertyId,
    "affiliateId": affiliateId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("createAffiliateLink", CreateAffiliateLink?.self, arguments: [
        "propertyId": .variable("propertyId"),
        "affiliateId": .variable("affiliateId")
      ]),
    ] }

    public var createAffiliateLink: CreateAffiliateLink? { __data["createAffiliateLink"] }

    /// CreateAffiliateLink
    ///
    /// Parent Type: `AffiliateLinksType`
    public struct CreateAffiliateLink: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateLinksType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
