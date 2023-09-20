// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateDocumentAffiliateUserMutation: GraphQLMutation {
    static let operationName: String = "createDocumentAffiliateUser"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createDocumentAffiliateUser", CreateDocumentAffiliateUser?.self, arguments: [
          "userId": .variable("userId"),
          "fileName": .variable("fileName"),
          "fileType": .variable("fileType")
        ]),
      ] }

      var createDocumentAffiliateUser: CreateDocumentAffiliateUser? { __data["createDocumentAffiliateUser"] }

      /// CreateDocumentAffiliateUser
      ///
      /// Parent Type: `AffiliateUserDocumentManagementType`
      struct CreateDocumentAffiliateUser: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserDocumentManagementType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("photosCount", Int?.self),
        ] }

        var status: Int? { __data["status"] }
        var photosCount: Int? { __data["photosCount"] }
      }
    }
  }

}