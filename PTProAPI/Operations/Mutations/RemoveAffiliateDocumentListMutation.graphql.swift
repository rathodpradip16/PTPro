// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class RemoveAffiliateDocumentListMutation: GraphQLMutation {
  public static let operationName: String = "removeAffiliateDocumentList"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("removeAffiliateDocumentList", RemoveAffiliateDocumentList?.self, arguments: [
        "id": .variable("id"),
        "userId": .variable("userId")
      ]),
    ] }

    public var removeAffiliateDocumentList: RemoveAffiliateDocumentList? { __data["removeAffiliateDocumentList"] }

    /// RemoveAffiliateDocumentList
    ///
    /// Parent Type: `AffiliateUserDocumentManagementType`
    public struct RemoveAffiliateDocumentList: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserDocumentManagementType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("photosCount", Int?.self),
        .field("removePhoto", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var photosCount: Int? { __data["photosCount"] }
      public var removePhoto: String? { __data["removePhoto"] }
    }
  }
}
