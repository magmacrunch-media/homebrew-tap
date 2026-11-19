class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/20/00/276d9bc95794793d1e8679b01f7d5dff440be1c35d05dadcf70abec53bc4/texastoast-0.12.3.tar.gz"
  sha256 "aaf0349ab1202e6b5962ee9c893b97e51de2be9e4a656fb16c3fbeed98d500be"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/magmacrunch-media/homebrew-tap/releases/download/texastoast-0.12.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e4a6fe8930d507f0d3bd2af21e5960a4ee4d2e0238c6e79e5bb4ca8226fb2201"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c8ff3ab4e062b569e72d4ce2e589194d8624f0bc4a21c4244840620c01f6882c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "177fe5a07803eb7c199aa4ce494bb17ddf2925bcbdd8dd0bb089aef46cb00b3d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "63c055bdff048670563083f3f3490abe324114a007232760b3b67b729d883a29"
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
