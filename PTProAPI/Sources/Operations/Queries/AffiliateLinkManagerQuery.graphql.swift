// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AffiliateLinkManagerQuery: GraphQLQuery {
  public static let operationName: String = "affiliateLinkManager"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("affiliateLinkManager", AffiliateLinkManager?.self, arguments: [
        "userId": .variable("userId"),
        "address": .variable("address")
      ]),
    ] }

    public var affiliateLinkManager: AffiliateLinkManager? { __data["affiliateLinkManager"] }

    /// AffiliateLinkManager
    ///
    /// Parent Type: `Resultdata`
    public struct AffiliateLinkManager: PTProAPI.SelectionSet {
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

      /// AffiliateLinkManager.Result
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
          .field("affiliateId", String?.self),
          .field("referralId", String?.self),
          .field("createdAt", String?.self),
          .field("clickResult", Int?.self),
          .field("earning", Double?.self),
          .field("listPhotos", [ListPhoto?]?.self),
          .field("listingData", ListingData?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var affiliateId: String? { __data["affiliateId"] }
        public var referralId: String? { __data["referralId"] }
        public var createdAt: String? { __data["createdAt"] }
        public var clickResult: Int? { __data["clickResult"] }
        public var earning: Double? { __data["earning"] }
        public var listPhotos: [ListPhoto?]? { __data["listPhotos"] }
        public var listingData: ListingData? { __data["listingData"] }

        /// AffiliateLinkManager.Result.ListPhoto
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

        /// AffiliateLinkManager.Result.ListingData
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
            .field("affiliate_commission", Double?.self),
          ] }

          public var basePrice: Double? { __data["basePrice"] }
          public var currency: String? { __data["currency"] }
          public var affiliate_commission: Double? { __data["affiliate_commission"] }
        }
      }
    }
  }
}
