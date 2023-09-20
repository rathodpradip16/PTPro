// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AffiliateShowDocumentListQuery: GraphQLQuery {
  public static let operationName: String = "affiliateShowDocumentList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query affiliateShowDocumentList($userId: String) { affiliateShowDocumentList(userId: $userId) { __typename id userId fileName fileType } }"#
    ))

  public var userId: GraphQLNullable<String>

  public init(userId: GraphQLNullable<String>) {
    self.userId = userId
  }

  public var __variables: Variables? { ["userId": userId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("affiliateShowDocumentList", [AffiliateShowDocumentList?]?.self, arguments: ["userId": .variable("userId")]),
    ] }

    public var affiliateShowDocumentList: [AffiliateShowDocumentList?]? { __data["affiliateShowDocumentList"] }

    /// AffiliateShowDocumentList
    ///
    /// Parent Type: `AffiliateUserDocumentManagementType`
    public struct AffiliateShowDocumentList: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AffiliateUserDocumentManagementType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int?.self),
        .field("userId", PTProAPI.ID.self),
        .field("fileName", String?.self),
        .field("fileType", String?.self),
      ] }

      public var id: Int? { __data["id"] }
      public var userId: PTProAPI.ID { __data["userId"] }
      public var fileName: String? { __data["fileName"] }
      public var fileType: String? { __data["fileType"] }
    }
  }
}
