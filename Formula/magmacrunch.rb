class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunch-media/magmacrunch"
  url "https://files.pythonhosted.org/packages/48/b5/3128c776d1a37720beebce6133d2ceb167646f4689e30f752261c1f79dd9/magmacrunch-0.6.0.tar.gz"
  sha256 "b4f665e3669ff07b8a89c89e09cafddda0e908d774c4e2393299cfbab9441084"
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
    url "https://files.pythonhosted.org/packages/43/c8/881c89da2a6483896b4b8d6f3a3f3b16b2a8b2a130a99730578b5c20f5a2/magmacrunch_george_boole-0.4.0.tar.gz"
    sha256 "961457db21398fb3d012fc2fdca4dda651adb46d9504871ccc739552e61f9bbf"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/04/45/17c1fca7dfda88c14a97a4164ffa77a6452edf490be7bfc7ad3dfc6973a1/magmacrunch_moonlight_drift-0.4.0.tar.gz"
    sha256 "9162b5698980d970444e2a1ec905a365aa24422c1c8f14f9df156638bf763409"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/7a/17/62f5e80c99b9d15a83999b0ffabbc9b6c5c9511ac1cc4d27e288cf8e8df8/magmacrunch_thld-0.4.0.tar.gz"
    sha256 "333147ea574bf668fa23b64bc887ea44842fa981863037118f013e05bd18f59e"
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
    url "https://files.pythonhosted.org/packages/69/b7/802a56eca9f2fac455b8bab5375a2647b0f0e14a2cd63ef077de3c4a7658/platformdirs-4.11.7.tar.gz"
    sha256 "4f41487eeeeeb07f3a6625e61d9bc0ae6809f92d3386dbd74392fbb76108104d"
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
