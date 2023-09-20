// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class AffiliateSearchListingQuery: GraphQLQuery {
    static let operationName: String = "affiliateSearchListing"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query affiliateSearchListing($userId: String, $address: String, $orderBy: String) { affiliateSearchListing(userId: $userId, address: $address, orderBy: $orderBy) { __typename results { __typename id title city affiliateId referralId isGenerated description listPhotos { __typename id name type } listingData { __typename basePrice currency } } status errorMessage } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var address: GraphQLNullable<String>
    public var orderBy: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      address: GraphQLNullable<String>,
      orderBy: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.address = address
      self.orderBy = orderBy
    }

    public var __variables: Variables? { [
      "userId": userId,
      "address": address,
      "orderBy": orderBy
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("affiliateSearchListing", AffiliateSearchListing?.self, arguments: [
          "userId": .variable("userId"),
          "address": .variable("address"),
          "orderBy": .variable("orderBy")
        ]),
      ] }

      var affiliateSearchListing: AffiliateSearchListing? { __data["affiliateSearchListing"] }

      /// AffiliateSearchListing
      ///
      /// Parent Type: `Resultdata`
      struct AffiliateSearchListing: PTProAPI.SelectionSet {
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

        /// AffiliateSearchListing.Result
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
            .field("city", String?.self),
            .field("affiliateId", String?.self),
            .field("referralId", String?.self),
            .field("isGenerated", Int?.self),
            .field("description", String?.self),
            .field("listPhotos", [ListPhoto?]?.self),
            .field("listingData", ListingData?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var city: String? { __data["city"] }
          var affiliateId: String? { __data["affiliateId"] }
          var referralId: String? { __data["referralId"] }
          var isGenerated: Int? { __data["isGenerated"] }
          var description: String? { __data["description"] }
          var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
          var listingData: ListingData? { __data["listingData"] }

          /// AffiliateSearchListing.Result.ListPhoto
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

          /// AffiliateSearchListing.Result.ListingData
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
            ] }

            var basePrice: Double? { __data["basePrice"] }
            var currency: String? { __data["currency"] }
          }
        }
      }
    }
  }

}