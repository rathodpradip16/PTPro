// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateWishListGroupMutation: GraphQLMutation {
  public static let operationName: String = "CreateWishListGroup"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateWishListGroup($name: String!, $isPublic: String, $id: Int) { CreateWishListGroup(name: $name, isPublic: $isPublic, id: $id) { __typename status errorMessage results { __typename name isPublic id } } }"#
    ))

  public var name: String
  public var isPublic: GraphQLNullable<String>
  public var id: GraphQLNullable<Int>

  public init(
    name: String,
    isPublic: GraphQLNullable<String>,
    id: GraphQLNullable<Int>
  ) {
    self.name = name
    self.isPublic = isPublic
    self.id = id
  }

  public var __variables: Variables? { [
    "name": name,
    "isPublic": isPublic,
    "id": id
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("CreateWishListGroup", CreateWishListGroup?.self, arguments: [
        "name": .variable("name"),
        "isPublic": .variable("isPublic"),
        "id": .variable("id")
      ]),
    ] }

    public var createWishListGroup: CreateWishListGroup? { __data["CreateWishListGroup"] }

    /// CreateWishListGroup
    ///
    /// Parent Type: `GetWishListType`
    public struct CreateWishListGroup: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetWishListType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", Results?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: Results? { __data["results"] }

      /// CreateWishListGroup.Results
      ///
      /// Parent Type: `WishListGroup`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.WishListGroup }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("isPublic", String?.self),
          .field("id", Int?.self),
        ] }

        public var name: String? { __data["name"] }
        public var isPublic: String? { __data["isPublic"] }
        public var id: Int? { __data["id"] }
      }
    }
  }
}
