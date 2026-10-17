class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/48/28/53d4c8e3c5dac834dd05081e7a1d8f3b69f935d117ce523ee61e1fb20d2c/texastoast-0.12.0.tar.gz"
  sha256 "c34e2d7648550818774e017809e8ecba58ae7c1c66b74363fe74fad91f753567"
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
