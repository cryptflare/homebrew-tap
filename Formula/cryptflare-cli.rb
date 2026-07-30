# Homebrew formula stub for the CryptFlare CLI.
#
# This file is committed inside the monorepo so Renovate / Dependabot can
# track version bumps. The actual published tap lives in a dedicated
# `homebrew-tap` repository under the `cryptflare` GitHub org. After each
# `@cryptflare/cli` release, a workflow copies this file into that tap
# repo with the version + sha256 substituted in.
#
# Once published, end users install with:
#   brew install cryptflare/tap/cryptflare-cli
#
# To update by hand:
#   1. Pick the new version from https://www.npmjs.com/package/@cryptflare/cli
#   2. Compute the tarball sha256:
#        curl -sL https://registry.npmjs.org/@cryptflare/cli/-/cli-<version>.tgz | shasum -a 256
#   3. Update `version` and `sha256` below.

class CryptflareCli < Formula
  desc "Manage CryptFlare secrets, pods, and environments from the terminal"
  homepage "https://cryptflare.com/cli"
  url "https://registry.npmjs.org/@cryptflare/cli/-/cli-0.5.2.tgz"
  version "0.5.2"
  sha256 "db8697a43a5b5888547763616afd9b24b787dd2d50ac08bbd76bdd9fb0bd9d59"
  license "Apache-2.0"

  depends_on "node@22"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/cf"]
  end

  test do
    output = shell_output("#{bin}/cf --version")
    assert_match version.to_s, output
  end
end
