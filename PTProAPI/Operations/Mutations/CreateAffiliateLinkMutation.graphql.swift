// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateAffiliateLinkMutation: GraphQLMutation {
    static let operationName: String = "createAffiliateLink"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createAffiliateLink", CreateAffiliateLink?.self, arguments: [
          "propertyId": .variable("propertyId"),
          "affiliateId": .variable("affiliateId")
        ]),
      ] }

      var createAffiliateLink: CreateAffiliateLink? { __data["createAffiliateLink"] }

      /// CreateAffiliateLink
      ///
      /// Parent Type: `AffiliateLinksType`
      struct CreateAffiliateLink: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateLinksType }
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