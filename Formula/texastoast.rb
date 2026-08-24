class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine and Magma Hub I2C layer for magmacrunch game systems"
  homepage "https://github.com/magmacrunchmedia/texastoast"
  url "https://files.pythonhosted.org/packages/4d/ff/4d6a891defd52a5aa3c1607da3937a5f775bb48d8138a01281801b46a99b/texastoast-0.1.2.tar.gz"
  sha256 "117363fc4b10cb8a60bbdf2b0c9fe30368bf383f3fd4ef51cddf878861107734"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/python3.12", "-c", "import texastoast; print(texastoast.__version__)"
  end
end
