# Swift Package Manager help

```s
swift package -h            
OVERVIEW: Perform operations on Swift packages

SEE ALSO: swift build, swift run, swift test

USAGE: swift package <options> <subcommand>

OPTIONS:
  -Xcc <Xcc>              Pass flag through to all C compiler invocations
  -Xswiftc <Xswiftc>      Pass flag through to all Swift compiler invocations
  -Xlinker <Xlinker>      Pass flag through to all linker invocations
  -Xcxx <Xcxx>            Pass flag through to all C++ compiler invocations
  -c, --configuration <configuration>
                          Build with configuration (default: debug)
  --build-path <build-path>
                          Specify build/cache directory
  --cache-path <cache-path>
                          Specify the shared cache directory
  --config-path <config-path>
                          Specify the shared configuration directory
  --security-path <security-path>
                          Specify the shared security directory
  --enable-repository-cache/--disable-repository-cache
                          Use a shared cache when fetching repositories (default: true)
  -C, --chdir <chdir>
  --package-path <package-path>
                          Change working directory before any other operation
  --multiroot-data-file <multiroot-data-file>
  --enable-prefetching/--disable-prefetching
                          (default: true)
  -v, --verbose           Increase verbosity to include informational output
  --very-verbose, --vv    Increase verbosity to include debug output
  --disable-sandbox       Disable using the sandbox when executing subprocesses
  --manifest-cache <manifest-cache>
                          Caching mode of Package.swift manifests (shared: shared cache, local: package's build directory, none: disabled (default: shared)
  --destination <destination>
  --triple <triple>
  --sdk <sdk>
  --toolchain <toolchain>
  --static-swift-stdlib/--no-static-swift-stdlib
                          Link Swift stdlib statically (default: false)
  --skip-update           Skip updating dependencies from their remote during a resolution
  --sanitize <sanitize>   Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo
  --enable-code-coverage/--disable-code-coverage
                          Enable code coverage (default: false)
  --force-resolved-versions, --disable-automatic-resolution, --only-use-versions-from-resolved-file
                          Only use versions from the Package.resolved file and fail resolution if it is out-of-date
  --auto-index-store/--enable-index-store/--disable-index-store
                          Enable or disable indexing-while-building feature (default: autoIndexStore)
  --enable-parseable-module-interfaces
  -j, --jobs <jobs>       The number of jobs to spawn in parallel during the build process
  --enable-build-manifest-caching/--disable-build-manifest-caching
                          (default: true)
  --emit-swift-module-separately
  --use-integrated-swift-driver
  --experimental-explicit-module-build
  --print-manifest-job-graph
                          Write the command graph for the build manifest as a graphviz file
  --build-system <build-system>
                          (default: native)
  --enable-netrc/--disable-netrc
                          Load credentials from a .netrc file (default: true)
  --netrc-file <netrc-file>
                          Specify the .netrc file path.
  --enable-keychain/--disable-keychain
                          Search credentials in macOS keychain (default: true)
  --resolver-fingerprint-checking <resolver-fingerprint-checking>
                          (default: warn)
  --version               Show the version.
  -h, -help, --help       Show help information.

SUBCOMMANDS:
  clean                   Delete build artifacts
  purge-cache             Purge the global repository cache.
  reset                   Reset the complete cache/build directory
  update                  Update package dependencies
  describe                Describe the current package
  init                    Initialize a new package
  _format
  diagnose-api-breaking-changes
                          Diagnose API-breaking changes to Swift modules in a package
  dump-symbol-graph       Dump Symbol Graph
  dump-pif
  dump-package            Print parsed Package.swift as JSON
  edit                    Put a package in editable mode
  unedit                  Remove a package from editable mode
  config                  Manipulate configuration of the package
  resolve                 Resolve package dependencies
  show-dependencies       Print the resolved dependency graph
  tools-version           Manipulate tools version of the current package
  generate-xcodeproj      Generates an Xcode project. This command will be deprecated soon.
  compute-checksum        Compute the checksum for a binary artifact.
  archive-source          Create a source archive for the package
  completion-tool         Completion tool (for shell completions)
  plugin                  Invoke a command plugin or perform other actions on command plugins

  See 'swift help package <subcommand>' for detailed help.
```