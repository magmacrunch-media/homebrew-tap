class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunchmedia/texastoast"
  url "https://files.pythonhosted.org/packages/32/c3/a1cd1cb1f0a3c95f3f20cf8a7ae661107b605b3bbdfeaad39558d3448662/texastoast-0.11.0.tar.gz"
  sha256 "0af1ce24da3092c5c8ffa402bd110450fb0cc0f977a5c3f892745e2fd37258ef"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/magmacrunchmedia/homebrew-tap/releases/download/texastoast-0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "cabbb1b2f24dc87585fea3d39aa8ca0d914e57af937abcf901139f6786acdf66"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e68dbf475a566c0d2b5467acfc4cdc25bdb851ecae9ee7c4e073ffb1dca7da9e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "81bbdc0a8c6661ae3e28a26008ce643a86ed7e56ec756c68b2d7a4f87a5c6a20"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "018ed014f4205124eb14c6fcce4c9006990409d416c9b6c5fe6ef364ded9aac4"
  end

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    # The virtualenv's own interpreter, not bin/. virtualenv_install_with_resources
    # builds the venv under libexec and links only console scripts into bin, so
    # there is no bin/python3.12 here to run this with.
    output = shell_output("#{libexec}/bin/python -c 'import texastoast; print(texastoast.__version__)'")
    assert_match version.to_s, output
  end
end
