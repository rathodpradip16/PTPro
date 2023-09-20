// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public struct ProfileFields: PTProAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment profileFields on userProfile { __typename profileId firstName lastName picture location }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
  public static var __selections: [Apollo.Selection] { [
    .field("__typename", String.self),
    .field("profileId", Int?.self),
    .field("firstName", String?.self),
    .field("lastName", String?.self),
    .field("picture", String?.self),
    .field("location", String?.self),
  ] }

  public var profileId: Int? { __data["profileId"] }
  public var firstName: String? { __data["firstName"] }
  public var lastName: String? { __data["lastName"] }
  public var picture: String? { __data["picture"] }
  public var location: String? { __data["location"] }
}
