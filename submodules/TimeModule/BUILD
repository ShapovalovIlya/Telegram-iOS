load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "TimeModule",
    module_name = "TimeModule",
    srcs = glob([
        "Sources/**/*.swift",
    ]),
    copts = [
        "-warnings-as-errors",
    ],
    deps = [
        "//submodules/SSignalKit/SwiftSignalKit:SwiftSignalKit",
    ],
    visibility = [
        "//visibility:public",
    ],
)
