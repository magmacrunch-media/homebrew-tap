class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/97/6b/3a933e0ee083b5a4378da8279d7e1a7cc28f47f451e08da81e999265034f/texastoast-0.11.2.tar.gz"
  sha256 "882742928ba5cec3f71a93dcbc88ec6b4269d57f617a3f5c982032e8993b55e8"
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
