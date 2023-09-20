// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  struct ProfileFields: PTProAPI.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment profileFields on userProfile { __typename profileId firstName lastName picture location }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
    static var __selections: [Apollo.Selection] { [
      .field("__typename", String.self),
      .field("profileId", Int?.self),
      .field("firstName", String?.self),
      .field("lastName", String?.self),
      .field("picture", String?.self),
      .field("location", String?.self),
    ] }

    var profileId: Int? { __data["profileId"] }
    var firstName: String? { __data["firstName"] }
    var lastName: String? { __data["lastName"] }
    var picture: String? { __data["picture"] }
    var location: String? { __data["location"] }
  }

}