class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunch-media/magmacrunch"
  url "https://files.pythonhosted.org/packages/68/5b/1b29464760f44098546c3f67addf8ae9fa23becc9af0e803bee4f186b125/magmacrunch-0.8.0.tar.gz"
  sha256 "afd50437c01be186e05bba74a9edc4763ef84a6d9e92941945332c9a7687955e"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/37/f1/b3e28d8d972778e0aab776602892a6c81ec372b414def576fe9afe76b4d3/magmacrunch_george_boole-0.5.1.tar.gz"
    sha256 "c8f15f86915f3fcf7e68c49646ed47b161fe14104d5025977734b2a6894486cb"
  end

  resource "magmacrunch-jhc" do
    url "https://files.pythonhosted.org/packages/61/0c/6d07952f1d93736648154c7f899d19628adb4e29bd990ca3a960d4170fd4/magmacrunch_jhc-0.1.0.tar.gz"
    sha256 "ee6cd8c30b49c9913cf61514ce1578405331d4cb4b570a07b0013ea5c06d47e2"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/a0/59/ec5e3e2a9bd5367d82bf47ec22075758273f723f8f84b7fb213e55537b6c/magmacrunch_moonlight_drift-0.5.0.tar.gz"
    sha256 "e1d4e0d7f46e064180968109903b8cc89949171a0a4d50750caac69283931cdf"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/26/50/aa163db1adff8166b535809998cde910e81db2eeee35da009d5b6e52e34d/magmacrunch_thld-0.5.0.tar.gz"
    sha256 "a11dad495326436c152c3d19e51ca4beab6f092d88c7e66a24cfa8811be24cd9"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/53/18/f3bb8ef0d3b930692343da8aa4d3cbcd6749477c053959395ac81965a6e9/platformdirs-4.11.8.tar.gz"
    sha256 "f23abafea7dd4276d1f29104b83598d7dcc567cafd07c9c951e66665645437fc"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # --list enumerates the magmacrunch.games entry point group, so this
    # exercises the seam the arcade is built on rather than just proving the
    # module imports: a cabinet that failed to install shows up as a missing
    # line here.
    output = shell_output("#{bin}/magmacrunch --list")
    assert_match "george-boole", output
    assert_match "thld", output
    assert_match "moonlight-drift", output
  end
end
