# Version number scheme

Boken Engine follows the usual version number convention described as:

**x.y.z**, where:

x: is the **Major version** number, and is only incremented when a significant amount of new functionality is added to the previous release. This new major version may not be completely backwards compatible with major versions lesser than this.

y: is the **Minor version** number, and is only incremented when some, backwards-compabile functionality is added to the previous release.

z: is the **Patch version** number, and is incremented when bug fixes and improvements that do not change the API are added to the previous release.

# Release candidates

When there are enough changes to the code to increment version number, a release candidate is created by tagging the codebase which is intended to release with the schema: x.y.z-RC1, where x.y.z is the version number to be released. When all code tests (see *release process steps*) are passed sucessfully, this Release Candidate becomes the new release. If a test fails, the new patched version will be the Release Candidate 2 (RC2), and so on.

# When to release a new version

A new version should be released when:

- A new functionality changes the API specification or behaviour.
- Requested improvements and relevant new features are added.
- Fixes are made to relevant bugs.

# Release process steps

1. Create a new branch properly tagged with the new candidate. For instance, if we want to release 1.2.3, the new tag should be called 1.2.3-RC1
2. Until the release process is finished, all new commits should be done to a separate, non main branch.
3. Run all the mandatory check to guarantee code stability:
  - Complete build with no error nor warnings
  - All automated code tests
  - Swiftlint and Tailor Linters
  - Lizard code quality tool
4. It is convenient to check the new version in a sample host application that worked fine in the previous version (unless a backwards-incompatible major version release)
5. If some of the previous checks fail, fix what causes it and commit them incrementing Release Candidate number. If all checks passes, continue with next step.
6. Tag the commit which points to the code which is going to be released (sucessfully tested RC).
7. Modify PodSpec file according to the new tag and version number.
8. Modify changelog file
9. Merge the release branch to main branch (no conflicts should exists as no new commits should have been made to the main branch). 
10. Release is finished.

# References

- http://oss-watch.ac.uk/resources/releasemanagement
- https://en.wikipedia.org/wiki/Software_versioning
- https://en.wikipedia.org/wiki/Software_release_life_cycle
- https://semver.org/
