// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateAffiliateUserWebListMutation: GraphQLMutation {
    static let operationName: String = "CreateAffiliateUserWebList"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation CreateAffiliateUserWebList($userId: String, $websiteName: String, $websiteUrl: String, $websiteAbout: String, $typeList: String, $websiteDrive: String, $typesOfWebsite: String, $primryJoining: String, $websiteVisitors: String, $buildLinks: String, $websiteMonitize: String) { createAffiliateUserWebList( userId: $userId websiteName: $websiteName websiteUrl: $websiteUrl websiteAbout: $websiteAbout typeList: $typeList websiteDrive: $websiteDrive typesOfWebsite: $typesOfWebsite primryJoining: $primryJoining websiteVisitors: $websiteVisitors buildLinks: $buildLinks websiteMonitize: $websiteMonitize ) { __typename status errorMessage } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var websiteName: GraphQLNullable<String>
    public var websiteUrl: GraphQLNullable<String>
    public var websiteAbout: GraphQLNullable<String>
    public var typeList: GraphQLNullable<String>
    public var websiteDrive: GraphQLNullable<String>
    public var typesOfWebsite: GraphQLNullable<String>
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
      typesOfWebsite: GraphQLNullable<String>,
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
      self.typesOfWebsite = typesOfWebsite
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
      "typesOfWebsite": typesOfWebsite,
      "primryJoining": primryJoining,
      "websiteVisitors": websiteVisitors,
      "buildLinks": buildLinks,
      "websiteMonitize": websiteMonitize
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createAffiliateUserWebList", CreateAffiliateUserWebList?.self, arguments: [
          "userId": .variable("userId"),
          "websiteName": .variable("websiteName"),
          "websiteUrl": .variable("websiteUrl"),
          "websiteAbout": .variable("websiteAbout"),
          "typeList": .variable("typeList"),
          "websiteDrive": .variable("websiteDrive"),
          "typesOfWebsite": .variable("typesOfWebsite"),
          "primryJoining": .variable("primryJoining"),
          "websiteVisitors": .variable("websiteVisitors"),
          "buildLinks": .variable("buildLinks"),
          "websiteMonitize": .variable("websiteMonitize")
        ]),
      ] }

      var createAffiliateUserWebList: CreateAffiliateUserWebList? { __data["createAffiliateUserWebList"] }

      /// CreateAffiliateUserWebList
      ///
      /// Parent Type: `AffiliateUserverificationwebType`
      struct CreateAffiliateUserWebList: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserverificationwebType }
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