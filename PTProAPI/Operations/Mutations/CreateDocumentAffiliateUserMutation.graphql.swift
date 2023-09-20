// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class CreateDocumentAffiliateUserMutation: GraphQLMutation {
  public static let operationName: String = "createDocumentAffiliateUser"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation createDocumentAffiliateUser($userId: String!, $fileName: String, $fileType: String) { createDocumentAffiliateUser( userId: $userId fileName: $fileName fileType: $fileType ) { __typename status photosCount } }"#
    ))

  public var userId: String
  public var fileName: GraphQLNullable<String>
  public var fileType: GraphQLNullable<String>

  public init(
    userId: String,
    fileName: GraphQLNullable<String>,
    fileType: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.fileName = fileName
    self.fileType = fileType
  }

  public var __variables: Variables? { [
    "userId": userId,
    "fileName": fileName,
    "fileType": fileType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("createDocumentAffiliateUser", CreateDocumentAffiliateUser?.self, arguments: [
        "userId": .variable("userId"),
        "fileName": .variable("fileName"),
        "fileType": .variable("fileType")
      ]),
    ] }

    public var createDocumentAffiliateUser: CreateDocumentAffiliateUser? { __data["createDocumentAffiliateUser"] }

    /// CreateDocumentAffiliateUser
    ///
    /// Parent Type: `AffiliateUserDocumentManagementType`
    public struct CreateDocumentAffiliateUser: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserDocumentManagementType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("photosCount", Int?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var photosCount: Int? { __data["photosCount"] }
    }
  }
}
