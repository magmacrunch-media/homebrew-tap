class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunchmedia/texastoast"
  url "https://files.pythonhosted.org/packages/85/43/5ef7e93ab84a244e99d01cd60c0b085ac8f313e40764291f339211ad37a4/texastoast-0.1.3.tar.gz"
  sha256 "0ddb5be097eaf36adc0ecf5aef37f979c165bd462c8ff77107592d21d141f990"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/python3.12", "-c", "import texastoast; print(texastoast.__version__)"
  end
end
