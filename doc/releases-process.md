# Version number scheme

Boken Engine follows the usual version number convention described as:

**x.y.z**, where

x: is the **Major version** number, and is only incremented when a significant amount of new functionality is added to the previous release. This new major version may not be completely backwards compatible with major versions lesser than this.

y: is the **Minor version** number, and is only incremented when some, backwards-compabile functionality is added to the previous release.

z: is the **Patch version** number, and is incremented when bug fixes and improvements that do not change the API are added to the previous release.

## Release candidates



# When to release a new version



# Release process steps

1. Create a new branch properly tagged with the new candidate. For instance, if we want to release 1.2.3, the new tag should be called 1.2.3-RC1
2. Tag the commit which points to the new release code.
3. 
4. Run all the mandatory check to guarantee code stability:
  - Complete build with no error nor warnings
  - All automated code tests
  - Swiftlint and Tailor Linters
  - Lizard code quality tool
5. It is convenient to check the new version in a sample host application that worked fine in the previous version (unless a backwards-incompatible major version release)
6. If some of the previous checks fail, fix what causes it and increase Release Candidate number. If all checks passes, continue with next step.
7. Modify PodSpec file according to the new tag and version number.
8. Modify changelog file
9. Merge the release branch to main branch.
