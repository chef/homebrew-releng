class FileMod < Formula
  desc "Modify files via the CLI"
  homepage "https://github.com/chef/file-mod"
  url "https://github.com/chef/file-mod/archive/refs/tags/1.0.5.tar.gz"
  sha256 "524eef6512a15a6f9ef9ee06d3899ee8ab109eee4bb645747f6fb83cb1050757"
  head "https://github.com/chef/file-mod.git"
  license ""

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X github.com/chef/file-mod/commands.version=1.0.5"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test file-mod`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/file-mod", "--version"
  end
end
