class DidModify < Formula
  desc "CLI to detect if changes have been made in a git repository"
  homepage "https://github.com/chef/did-modify"
  url "https://github.com/chef/did-modify/archive/refs/tags/1.0.4.tar.gz"
  sha256 "88396bd7b2d112ccda921517c2293cbdadb215f79876ca13a7977b7f8efbee44"
  head "https://github.com/chef/did-modify.git"
  license ""

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args, "-ldflags", "-s -w -X github.com/chef/did-modify/commands.version=1.0.4"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test did-modify`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/did-modify", "--version"
  end
end
