class VaultUtil < Formula
  desc "CLI to augment interactions with Vault"
  homepage "https://github.com/chef/vault-util"
  url "https://github.com/chef/vault-util/archive/refs/tags/2.0.3.tar.gz"
  sha256 "20abc374a90ccf487c85443d1eab5c79072b41555019baf3356f17b4721df5ff"
  head "https://github.com/chef/vault-util.git"
  license ""

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args, "-ldflags", "-s -w -X github.com/chef/vault-util/commands.version=2.0.3"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vault-util`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/vault-util", "--version"
  end
end
