// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateReportUserMutation: GraphQLMutation {
    static let operationName: String = "createReportUser"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation createReportUser($reporterId: String, $userId: String, $reportType: String, $profileId: Int) { createReportUser( reporterId: $reporterId userId: $userId reportType: $reportType profileId: $profileId ) { __typename status errorMessage } }"#
      ))

    public var reporterId: GraphQLNullable<String>
    public var userId: GraphQLNullable<String>
    public var reportType: GraphQLNullable<String>
    public var profileId: GraphQLNullable<Int>

    public init(
      reporterId: GraphQLNullable<String>,
      userId: GraphQLNullable<String>,
      reportType: GraphQLNullable<String>,
      profileId: GraphQLNullable<Int>
    ) {
      self.reporterId = reporterId
      self.userId = userId
      self.reportType = reportType
      self.profileId = profileId
    }

    public var __variables: Variables? { [
      "reporterId": reporterId,
      "userId": userId,
      "reportType": reportType,
      "profileId": profileId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createReportUser", CreateReportUser?.self, arguments: [
          "reporterId": .variable("reporterId"),
          "userId": .variable("userId"),
          "reportType": .variable("reportType"),
          "profileId": .variable("profileId")
        ]),
      ] }

      var createReportUser: CreateReportUser? { __data["createReportUser"] }

      /// CreateReportUser
      ///
      /// Parent Type: `ReportUserResult`
      struct CreateReportUser: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReportUserResult }
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