// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetAffiliateUserStepQuery: GraphQLQuery {
    static let operationName: String = "getAffiliateUserStep"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getAffiliateUserStep($userId: String) { getAffiliateUserStep(userId: $userId) { __typename status errorMessage stepInfo stepDetails { __typename userId payeeName address city state zipcode country phoneNumber websiteName websiteUrl typesOfWebsite primryJoining websiteVisitors buildLinks websiteMonitize } } }"#
      ))

    public var userId: GraphQLNullable<String>

    public init(userId: GraphQLNullable<String>) {
      self.userId = userId
    }

    public var __variables: Variables? { ["userId": userId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getAffiliateUserStep", GetAffiliateUserStep?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var getAffiliateUserStep: GetAffiliateUserStep? { __data["getAffiliateUserStep"] }

      /// GetAffiliateUserStep
      ///
      /// Parent Type: `AffiliatestepType`
      struct GetAffiliateUserStep: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliatestepType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("stepInfo", String?.self),
          .field("stepDetails", [StepDetail?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var stepInfo: String? { __data["stepInfo"] }
        var stepDetails: [StepDetail?]? { __data["stepDetails"] }

        /// GetAffiliateUserStep.StepDetail
        ///
        /// Parent Type: `AffiliateUserverificationaccountType`
        struct StepDetail: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserverificationaccountType }
          static var __selections: [Apollo.Selection] { [
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

          var userId: String? { __data["userId"] }
          var payeeName: String? { __data["payeeName"] }
          var address: String? { __data["address"] }
          var city: String? { __data["city"] }
          var state: String? { __data["state"] }
          var zipcode: String? { __data["zipcode"] }
          var country: String? { __data["country"] }
          var phoneNumber: String? { __data["phoneNumber"] }
          var websiteName: String? { __data["websiteName"] }
          var websiteUrl: String? { __data["websiteUrl"] }
          var typesOfWebsite: String? { __data["typesOfWebsite"] }
          var primryJoining: String? { __data["primryJoining"] }
          var websiteVisitors: String? { __data["websiteVisitors"] }
          var buildLinks: String? { __data["buildLinks"] }
          var websiteMonitize: String? { __data["websiteMonitize"] }
        }
      }
    }
  }

}