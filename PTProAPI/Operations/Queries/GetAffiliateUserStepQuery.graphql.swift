// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetAffiliateUserStepQuery: GraphQLQuery {
    static let operationName: String = "getAffiliateUserStep"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getAffiliateUserStep($userId: String) { getAffiliateUserStep(userId: $userId) { __typename status errorMessage stepInfo stepDetails { __typename payeeName address address2 city countryCode state zipcode country phoneNumber websiteName websiteUrl websiteAbout typeList websiteDrive typesOfWebsite primryJoining websiteVisitors buildLinks websiteMonitize } } }"#
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
            .field("payeeName", String?.self),
            .field("address", String?.self),
            .field("address2", String?.self),
            .field("city", String?.self),
            .field("countryCode", Int?.self),
            .field("state", String?.self),
            .field("zipcode", String?.self),
            .field("country", String?.self),
            .field("phoneNumber", String?.self),
            .field("websiteName", String?.self),
            .field("websiteUrl", String?.self),
            .field("websiteAbout", String?.self),
            .field("typeList", String?.self),
            .field("websiteDrive", String?.self),
            .field("typesOfWebsite", String?.self),
            .field("primryJoining", String?.self),
            .field("websiteVisitors", String?.self),
            .field("buildLinks", String?.self),
            .field("websiteMonitize", String?.self),
          ] }

          var payeeName: String? { __data["payeeName"] }
          var address: String? { __data["address"] }
          var address2: String? { __data["address2"] }
          var city: String? { __data["city"] }
          var countryCode: Int? { __data["countryCode"] }
          var state: String? { __data["state"] }
          var zipcode: String? { __data["zipcode"] }
          var country: String? { __data["country"] }
          var phoneNumber: String? { __data["phoneNumber"] }
          var websiteName: String? { __data["websiteName"] }
          var websiteUrl: String? { __data["websiteUrl"] }
          var websiteAbout: String? { __data["websiteAbout"] }
          var typeList: String? { __data["typeList"] }
          var websiteDrive: String? { __data["websiteDrive"] }
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