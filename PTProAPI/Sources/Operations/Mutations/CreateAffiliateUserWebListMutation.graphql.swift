// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateAffiliateUserWebListMutation: GraphQLMutation {
  public static let operationName: String = "createAffiliateUserWebList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation createAffiliateUserWebList($userId: String, $websiteName: String, $websiteUrl: String, $websiteAbout: String, $typeList: String, $websiteDrive: String, $primryJoining: String, $websiteVisitors: String, $buildLinks: String, $websiteMonitize: String) { createAffiliateUserWebList( userId: $userId websiteName: $websiteName websiteUrl: $websiteUrl websiteAbout: $websiteAbout typeList: $typeList websiteDrive: $websiteDrive primryJoining: $primryJoining websiteVisitors: $websiteVisitors buildLinks: $buildLinks websiteMonitize: $websiteMonitize ) { __typename status errorMessage } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var websiteName: GraphQLNullable<String>
  public var websiteUrl: GraphQLNullable<String>
  public var websiteAbout: GraphQLNullable<String>
  public var typeList: GraphQLNullable<String>
  public var websiteDrive: GraphQLNullable<String>
  public var primryJoining: GraphQLNullable<String>
  public var websiteVisitors: GraphQLNullable<String>
  public var buildLinks: GraphQLNullable<String>
  public var websiteMonitize: GraphQLNullable<String>

  public init(
    userId: GraphQLNullable<String>,
    websiteName: GraphQLNullable<String>,
    websiteUrl: GraphQLNullable<String>,
    websiteAbout: GraphQLNullable<String>,
    typeList: GraphQLNullable<String>,
    websiteDrive: GraphQLNullable<String>,
    primryJoining: GraphQLNullable<String>,
    websiteVisitors: GraphQLNullable<String>,
    buildLinks: GraphQLNullable<String>,
    websiteMonitize: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.websiteName = websiteName
    self.websiteUrl = websiteUrl
    self.websiteAbout = websiteAbout
    self.typeList = typeList
    self.websiteDrive = websiteDrive
    self.primryJoining = primryJoining
    self.websiteVisitors = websiteVisitors
    self.buildLinks = buildLinks
    self.websiteMonitize = websiteMonitize
  }

  public var __variables: Variables? { [
    "userId": userId,
    "websiteName": websiteName,
    "websiteUrl": websiteUrl,
    "websiteAbout": websiteAbout,
    "typeList": typeList,
    "websiteDrive": websiteDrive,
    "primryJoining": primryJoining,
    "websiteVisitors": websiteVisitors,
    "buildLinks": buildLinks,
    "websiteMonitize": websiteMonitize
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createAffiliateUserWebList", CreateAffiliateUserWebList?.self, arguments: [
        "userId": .variable("userId"),
        "websiteName": .variable("websiteName"),
        "websiteUrl": .variable("websiteUrl"),
        "websiteAbout": .variable("websiteAbout"),
        "typeList": .variable("typeList"),
        "websiteDrive": .variable("websiteDrive"),
        "primryJoining": .variable("primryJoining"),
        "websiteVisitors": .variable("websiteVisitors"),
        "buildLinks": .variable("buildLinks"),
        "websiteMonitize": .variable("websiteMonitize")
      ]),
    ] }

    public var createAffiliateUserWebList: CreateAffiliateUserWebList? { __data["createAffiliateUserWebList"] }

    /// CreateAffiliateUserWebList
    ///
    /// Parent Type: `AffiliateUserverificationwebType`
    public struct CreateAffiliateUserWebList: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AffiliateUserverificationwebType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
