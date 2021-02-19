# Contributing to Boken Engine
We are really happy to know that you want to contribute to the project!
However, to ensure that the project keeps improving without compromising its integrity or quality, please follow this guide to ensure that your contribution is as useful as possible.

## Table of Contents
1. [What to know before contributing](#what-to-know-before-contributing)
2. [How can I contribute?](#how-can-i-contribute)
  - [Bug reporting](#bug-reporting)
  - [New features suggestion](#new-features-suggestion)
  - [Committing code to an issue](#committing-code-to-an-issue)
  - [Additional documentation](#additional-documentation)
3. [Styleguides](#styleguides)
  - [Swift styleguide](#swift-styleguide)
  - [Documentation styleguide](#documentation-styleguide)
4. [Issues, commits and Pull Requests](#issues-commits-and-pull-requests)
  - [Commit messages](#commit-messages)

## What to know before contributing

Please, be aware that Boken Engine **is a Framework written in Swift**. The code in the repository is the XCode project of the framework, and therefore, cannot be used directly to generate an iOS App.
Boken Engine is neither an iOS Application, a library nor a package. All contributions must respect the identity of the project and do not add anything that infringe it (i.e. making the project contents-specific, coupling it to a particular App or preventing it to be reusable as a framework)

## How can I contribute?

### Bug reporting

Before creating bug reports, please check if the problem has already been reported. If it has and the issue is still open, add a comment to the existing issue instead of opening a new one. If you find a Closed issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.
If the problem hasn't been reported, create a new [GitHub issue](https://guides.github.com/features/issues/), providing the following information:

-   **A clear and descriptive title**  for the issue to identify the problem.
-   **A description of the  steps which reproduce the problem**, as detailed as possible.
-   **Describe the behavior you observed after following the steps**  and why that behaviour is erroneous or unexpected.
-  If possible, **include screenshots and animated GIFs**  

### New features suggestion

Features / improvement suggestions are submitted as  [GitHub issues](https://guides.github.com/features/issues/).  Please, before submitting a new one, please check if the improvement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.
When creating a improvement issue, please provide the following information:

-   **Use a clear and descriptive title**  for the issue to identify the suggestion.
-   **Provide a description of the suggested enhancement**  as detailed as possible
-   **Explain why this improvement would be useful**  to most users 

### Committing code to an issue

Before writing any code for the repository, please review the Swift styleguides. Please, check that the new code will not compromise the quality, stability or security of the codebase.
Any new code is added to the repository using Pull Requests that must be reviewed and approved by the community before being merged or rebased to the repository.
When creating the commit and the pull request, please refer also to the section Issues, Commits and Pull Requests.
Whenever is possible, new features should have Unit Tests to maintain (or increase) the code test coverage before adding it.

### Additional documentation

New documentation contributions are also welcomed. They can improve the official documentation, add new examples or tutorials.
The new documents must be added to the "docs" folder, and they must be created or modified using the same issue - pull request method as the code contributions.
Document format should be MarkDown unless an alternative format is really necessary. Naming should adhere to underscore [kebab-case](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles).

## Styleguides

### Swift styleguide

#### Fundamentals

- **Clarity** at the point of use is your most important goal. Clarity is more important than brevity

- Projects should not throw any warnings when built.

#### Conventions

- Prefer methods and properties to free functions.

- Prefer to locate parameters with defaults toward the end.

- Conditional code checks "the golden path" (the most probable option) first. 

- Inverted checks (like !incorrect) are discouraged because of poor readability.

- Use argument labels (unless not useful or part of a grammatical phrase)

- If possible, avoid *any* type.

- Use self only when required by the compiler (i.e. disambiguate properties from arguments in initializers)

#### Code editing

- Use 2 blank spaces block indent

- Indentation is made with whitespaces, not with tabs

- Semicolons (;) are not used, either to terminate or separate statements.

- Annotations go onto a separate line before the declaration.

- Use OTBS brackets style

#### Naming

- Include all the words needed to avoid ambiguity, but omit needless words

- Name entities according to their roles, rather than their type constraints.

- Names of types and protocols are UpperCamelCase. Everything else is lowerCamelCase.

- Declarations should form correct human-readable phrases when read aloud.

- Methods without side-effects have **noun **names (originalSize()). Methods with side effects have **imperative verb** names (sort()). Non-mutating methods that return new values have **past participle** names (sorted()) or a **noun **if the operation is naturally described by it (union()) 

- Protocols that describe *what* something is should read as **nouns ** (Collection). Protocols that describe a capability should be named using -able, -ible, or -ing (Equatable, ProgressReporting).

- Avoid abbreviations

#### Comments

- **Self-documented code** is preferred over comments.

- When completely needed, comments must be written using double slash (//) instead of block syntax (/*...*/). Comments must be kept up-to-date or deleted.

- Public APIs should have HeaderDoc documentation using JavaDoc standards.

#### Imports

- All imports go alphabetically sorted at the very beginning of the file. Empty lines between imports are not used.

- Import only the modules a source file requires.

- Do not insert a blank line between imports.

### Documentation styleguide

Documentation should use MarkDown (.md) format. It must be written at least in English, but additional localized versions are also possible.

## Issues, commits and Pull Requests

Each pull request for new commits must be related to a particular issue, and will be reviewed by the community before being merged or rebased to the codebase.

### Commit messages

- Use the present tense and imperative mood ("Add feature", "Change cursor color")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line
- Consider starting the commit message with an applicable emoji (taken from the [Atom Contribution Guidelines](https://github.com/atom/atom/blob/master/CONTRIBUTING.md)):

    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :non-potable_water: `:non-potable_water:` when plugging memory leaks
    * :memo: `:memo:` when writing docs
    * :bug: `:bug:` when fixing a bug
    * :fire: `:fire:` when removing code or files
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :lock: `:lock:` when dealing with security
    * :shirt: `:shirt:` when removing linter warnings
