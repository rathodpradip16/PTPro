// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class CreateReportUserMutation: GraphQLMutation {
  public static let operationName: String = "createReportUser"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("createReportUser", CreateReportUser?.self, arguments: [
        "reporterId": .variable("reporterId"),
        "userId": .variable("userId"),
        "reportType": .variable("reportType"),
        "profileId": .variable("profileId")
      ]),
    ] }

    public var createReportUser: CreateReportUser? { __data["createReportUser"] }

    /// CreateReportUser
    ///
    /// Parent Type: `ReportUserResult`
    public struct CreateReportUser: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReportUserResult }
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
