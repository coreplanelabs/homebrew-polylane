# Homebrew formula for the Polylane CLI.
#
# This file belongs in the tap repository (github.com/coreplanelabs/homebrew-polylane)
# at Formula/polylane.rb so users can install via:
#
#   brew install coreplanelabs/polylane
#
# The release pipeline bumps `url` / `sha256` / `version` on every new release —
# see the update-homebrew job in .github/workflows/release.yml.
class Polylane < Formula
  desc "Agent-focused CLI for the Polylane platform"
  homepage "https://polylane.com"
  # Scoped npm tarball URL. Note the tarball filename after `/-/` uses the
  # unscoped basename (polylane), not the full scoped name.
  url "https://registry.npmjs.org/@coreplane/polylane/-/polylane-0.1.12.tgz"
  sha256 "edee37c7a2c2e8e2164babb49a8acf7d292bc866017514c8a494603ce062a6a4"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "polylane", shell_output("#{bin}/polylane --version")
    assert_match "Resources:", shell_output("#{bin}/polylane --help")
  end
end
