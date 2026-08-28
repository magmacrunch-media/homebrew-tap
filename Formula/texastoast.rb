class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunchmedia/texastoast"
  url "https://files.pythonhosted.org/packages/32/c3/a1cd1cb1f0a3c95f3f20cf8a7ae661107b605b3bbdfeaad39558d3448662/texastoast-0.11.0.tar.gz"
  sha256 "0af1ce24da3092c5c8ffa402bd110450fb0cc0f977a5c3f892745e2fd37258ef"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/python3.12", "-c", "import texastoast; print(texastoast.__version__)"
  end
end
