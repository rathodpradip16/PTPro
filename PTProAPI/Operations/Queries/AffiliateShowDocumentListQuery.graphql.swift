// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class AffiliateShowDocumentListQuery: GraphQLQuery {
    static let operationName: String = "affiliateShowDocumentList"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query affiliateShowDocumentList($userId: String) { affiliateShowDocumentList(userId: $userId) { __typename id userId fileName fileType } }"#
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
        .field("affiliateShowDocumentList", [AffiliateShowDocumentList?]?.self, arguments: ["userId": .variable("userId")]),
      ] }

      var affiliateShowDocumentList: [AffiliateShowDocumentList?]? { __data["affiliateShowDocumentList"] }

      /// AffiliateShowDocumentList
      ///
      /// Parent Type: `AffiliateUserDocumentManagementType`
      struct AffiliateShowDocumentList: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserDocumentManagementType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("userId", PTProAPI.ID.self),
          .field("fileName", String?.self),
          .field("fileType", String?.self),
        ] }

        var id: Int? { __data["id"] }
        var userId: PTProAPI.ID { __data["userId"] }
        var fileName: String? { __data["fileName"] }
        var fileType: String? { __data["fileType"] }
      }
    }
  }

}