class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine and Magma Hub I2C layer for magmacrunch game systems"
  homepage "https://github.com/magmacrunchmedia/texastoast"
  url "https://files.pythonhosted.org/packages/source/t/texastoast/texastoast-0.1.0.tar.gz"
  sha256 "f76120e486b11a0b0bf33868d8a1d8b3387b1baa7a8b4c3af8dcb01631f01303"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/python3.12", "-c", "import texastoast; print(texastoast.__version__)"
  end
end
