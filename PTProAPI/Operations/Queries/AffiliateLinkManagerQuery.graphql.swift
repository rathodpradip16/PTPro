// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class AffiliateLinkManagerQuery: GraphQLQuery {
    static let operationName: String = "affiliateLinkManager"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query affiliateLinkManager($userId: String, $address: String) { affiliateLinkManager(userId: $userId, address: $address) { __typename results { __typename id title affiliateId referralId createdAt clickResult earning listPhotos { __typename id name type } listingData { __typename basePrice currency affiliate_commission } } status errorMessage } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var address: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      address: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.address = address
    }

    public var __variables: Variables? { [
      "userId": userId,
      "address": address
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("affiliateLinkManager", AffiliateLinkManager?.self, arguments: [
          "userId": .variable("userId"),
          "address": .variable("address")
        ]),
      ] }

      var affiliateLinkManager: AffiliateLinkManager? { __data["affiliateLinkManager"] }

      /// AffiliateLinkManager
      ///
      /// Parent Type: `Resultdata`
      struct AffiliateLinkManager: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Resultdata }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// AffiliateLinkManager.Result
        ///
        /// Parent Type: `Searchlistaffiliate`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Searchlistaffiliate }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("affiliateId", String?.self),
            .field("referralId", String?.self),
            .field("createdAt", String?.self),
            .field("clickResult", Int?.self),
            .field("earning", Double?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var affiliateId: String? { __data["affiliateId"] }
          var referralId: String? { __data["referralId"] }
          var createdAt: String? { __data["createdAt"] }
          var clickResult: Int? { __data["clickResult"] }
          var earning: Double? { __data["earning"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingData: ListingData? { __data["listingData"] }

          /// AffiliateLinkManager.Result.ListPhoto
          ///
          /// Parent Type: `ListPhotoss`
          struct ListPhoto: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotoss }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("name", String?.self),
              .field("type", String?.self),
            ] }

            var id: Int? { __data["id"] }
            var name: String? { __data["name"] }
            var type: String? { __data["type"] }
          }

          /// AffiliateLinkManager.Result.ListingData
          ///
          /// Parent Type: `ListingDataa`
          struct ListingData: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListingDataa }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("basePrice", Double?.self),
              .field("currency", String?.self),
              .field("affiliate_commission", Double?.self),
            ] }

            var basePrice: Double? { __data["basePrice"] }
            var currency: String? { __data["currency"] }
            var affiliate_commission: Double? { __data["affiliate_commission"] }
          }
        }
      }
    }
  }

}