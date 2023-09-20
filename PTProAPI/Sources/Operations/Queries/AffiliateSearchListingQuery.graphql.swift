// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AffiliateSearchListingQuery: GraphQLQuery {
  public static let operationName: String = "affiliateSearchListing"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("affiliateSearchListing", AffiliateSearchListing?.self, arguments: [
        "userId": .variable("userId"),
        "address": .variable("address"),
        "orderBy": .variable("orderBy")
      ]),
    ] }

    public var affiliateSearchListing: AffiliateSearchListing? { __data["affiliateSearchListing"] }

    /// AffiliateSearchListing
    ///
    /// Parent Type: `Resultdata`
    public struct AffiliateSearchListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Resultdata }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// AffiliateSearchListing.Result
      ///
      /// Parent Type: `Searchlistaffiliate`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Searchlistaffiliate }
        public static var __selections: [ApolloAPI.Selection] { [
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

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var city: String? { __data["city"] }
        public var affiliateId: String? { __data["affiliateId"] }
        public var referralId: String? { __data["referralId"] }
        public var isGenerated: Int? { __data["isGenerated"] }
        public var description: String? { __data["description"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingData: ListingData? { __data["listingData"] }

        /// AffiliateSearchListing.Result.ListPhoto
        ///
        /// Parent Type: `ListPhotoss`
        public struct ListPhoto: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotoss }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("name", String?.self),
            .field("type", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
        }

        /// AffiliateSearchListing.Result.ListingData
        ///
        /// Parent Type: `ListingDataa`
        public struct ListingData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListingDataa }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("basePrice", Double?.self),
            .field("currency", String?.self),
          ] }

          public var basePrice: Double? { __data["basePrice"] }
          public var currency: String? { __data["currency"] }
        }
      }
    }
  }
}
