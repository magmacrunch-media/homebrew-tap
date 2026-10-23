class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/42/98/5f505a9b0f287b2d0e2a7c67258f583179c36cd35cc74f49f00e4e3a7a40/texastoast-0.12.2.tar.gz"
  sha256 "9d13b847803b77ae8c67c4ccdb2a537f90c6be2b9801805f97c5ada4fa38edb6"
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
