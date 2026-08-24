class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine and Magma Hub I2C layer for magmacrunch game systems"
  homepage "https://github.com/magmacrunchmedia/texastoast"
  url "https://files.pythonhosted.org/packages/5c/14/8f1d1697b83cc424de3303b8a1bb4bc1ece6d207d7464daec71734867943/texastoast-0.1.1.tar.gz"
  sha256 "1002250e50cd6882d4b51d466b971ade9a00a8cd71d03254a7e51fb6e6139f82"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/python3.12", "-c", "import texastoast; print(texastoast.__version__)"
  end
end
