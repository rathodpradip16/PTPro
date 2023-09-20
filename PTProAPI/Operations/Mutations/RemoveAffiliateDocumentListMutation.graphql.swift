// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class RemoveAffiliateDocumentListMutation: GraphQLMutation {
    static let operationName: String = "removeAffiliateDocumentList"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation removeAffiliateDocumentList($id: Int, $userId: String) { removeAffiliateDocumentList(id: $id, userId: $userId) { __typename status photosCount removePhoto } }"#
      ))

    public var id: GraphQLNullable<Int>
    public var userId: GraphQLNullable<String>

    public init(
      id: GraphQLNullable<Int>,
      userId: GraphQLNullable<String>
    ) {
      self.id = id
      self.userId = userId
    }

    public var __variables: Variables? { [
      "id": id,
      "userId": userId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("removeAffiliateDocumentList", RemoveAffiliateDocumentList?.self, arguments: [
          "id": .variable("id"),
          "userId": .variable("userId")
        ]),
      ] }

      var removeAffiliateDocumentList: RemoveAffiliateDocumentList? { __data["removeAffiliateDocumentList"] }

      /// RemoveAffiliateDocumentList
      ///
      /// Parent Type: `AffiliateUserDocumentManagementType`
      struct RemoveAffiliateDocumentList: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserDocumentManagementType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("photosCount", Int?.self),
          .field("removePhoto", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var photosCount: Int? { __data["photosCount"] }
        var removePhoto: String? { __data["removePhoto"] }
      }
    }
  }

}