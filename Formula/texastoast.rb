class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/26/96/a2f85678f4da5267c2040ca729f6203b4bbba9247f9b84c667f15d6d4755/texastoast-0.11.1.tar.gz"
  sha256 "d739641f2e971a543df861f07c4f16652160f0f8c04acee4d82360d1bf7b13dc"
  license "Apache-2.0"

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
