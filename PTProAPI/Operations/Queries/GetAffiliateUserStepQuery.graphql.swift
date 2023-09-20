// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetAffiliateUserStepQuery: GraphQLQuery {
  public static let operationName: String = "getAffiliateUserStep"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getAffiliateUserStep($userId: String) { getAffiliateUserStep(userId: $userId) { __typename status errorMessage stepInfo stepDetails { __typename userId payeeName address city state zipcode country phoneNumber websiteName websiteUrl typesOfWebsite primryJoining websiteVisitors buildLinks websiteMonitize } } }"#
    ))

  public var userId: GraphQLNullable<String>

  public init(userId: GraphQLNullable<String>) {
    self.userId = userId
  }

  public var __variables: Variables? { ["userId": userId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getAffiliateUserStep", GetAffiliateUserStep?.self, arguments: ["userId": .variable("userId")]),
    ] }

    public var getAffiliateUserStep: GetAffiliateUserStep? { __data["getAffiliateUserStep"] }

    /// GetAffiliateUserStep
    ///
    /// Parent Type: `AffiliatestepType`
    public struct GetAffiliateUserStep: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliatestepType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("stepInfo", String?.self),
        .field("stepDetails", [StepDetail?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var stepInfo: String? { __data["stepInfo"] }
      public var stepDetails: [StepDetail?]? { __data["stepDetails"] }

      /// GetAffiliateUserStep.StepDetail
      ///
      /// Parent Type: `AffiliateUserverificationaccountType`
      public struct StepDetail: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserverificationaccountType }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("userId", String?.self),
          .field("payeeName", String?.self),
          .field("address", String?.self),
          .field("city", String?.self),
          .field("state", String?.self),
          .field("zipcode", String?.self),
          .field("country", String?.self),
          .field("phoneNumber", String?.self),
          .field("websiteName", String?.self),
          .field("websiteUrl", String?.self),
          .field("typesOfWebsite", String?.self),
          .field("primryJoining", String?.self),
          .field("websiteVisitors", String?.self),
          .field("buildLinks", String?.self),
          .field("websiteMonitize", String?.self),
        ] }

        public var userId: String? { __data["userId"] }
        public var payeeName: String? { __data["payeeName"] }
        public var address: String? { __data["address"] }
        public var city: String? { __data["city"] }
        public var state: String? { __data["state"] }
        public var zipcode: String? { __data["zipcode"] }
        public var country: String? { __data["country"] }
        public var phoneNumber: String? { __data["phoneNumber"] }
        public var websiteName: String? { __data["websiteName"] }
        public var websiteUrl: String? { __data["websiteUrl"] }
        public var typesOfWebsite: String? { __data["typesOfWebsite"] }
        public var primryJoining: String? { __data["primryJoining"] }
        public var websiteVisitors: String? { __data["websiteVisitors"] }
        public var buildLinks: String? { __data["buildLinks"] }
        public var websiteMonitize: String? { __data["websiteMonitize"] }
      }
    }
  }
}
