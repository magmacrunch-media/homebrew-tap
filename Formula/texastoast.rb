class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/42/98/5f505a9b0f287b2d0e2a7c67258f583179c36cd35cc74f49f00e4e3a7a40/texastoast-0.12.2.tar.gz"
  sha256 "9d13b847803b77ae8c67c4ccdb2a537f90c6be2b9801805f97c5ada4fa38edb6"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/magmacrunch-media/homebrew-tap/releases/download/texastoast-0.12.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "01bdbbfb2eff283e51f79cc3d201be230ff28327664698fe9345880925b3945e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6b4c392642860363b792f099d06f150712d53147a6871d741de7e85af3c4ba5b"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "7ba6bd9153184f800142a782f7cc0c7bf1d3eb40fd37cf951ef4ee7908c9938c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f5d5a1796504afdc55594ae8f2f4135419dc9281a279a1fe495196e7f870b798"
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
