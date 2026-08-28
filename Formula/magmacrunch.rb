class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunchmedia/magmacrunch"
  url "https://files.pythonhosted.org/packages/c3/cd/5fb99efeeb55600280d2df1802cbae4c014726b521bc1dbd08fde8069462/magmacrunch-0.1.2.tar.gz"
  sha256 "90d88738a6080198b130fef89ef201cde9a58ae2faa7f7ea56022b084004d8e0"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/53/3e/79f35b8c31a1881893b7e62be80b2573f06e38db47c33065749293ee1b97/linkify_it_py-2.1.1.tar.gz"
    sha256 "a78f40fee177eb912e9d2375074108378523c38d3fde5d3ee804f465b6cfbfee"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/64/46/f92f5b998eb6e408243923c24c33066ac365242f29e9430d08abd21afd8e/magmacrunch_george_boole-0.2.0.tar.gz"
    sha256 "04017151823f24a8637907e20421d278539e7c7a93ac2677f0a74306ab7ad9e8"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/11/2a/20b678978feebb45c134cc644c7a41abeeb0821bb75a2928c7f81d131c18/magmacrunch_moonlight_drift-0.2.0.tar.gz"
    sha256 "4b5debae20bb750064ffb9307d6d6c6942574bb21dd0ced608ee540d0110a8a6"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/9d/86/397c20837e8b9e8c5496a9bdfd37e8a477b7ce2e158ccb78dbcfb5d76c77/magmacrunch_thld-0.1.1.tar.gz"
    sha256 "4bcbce45bde60e80d22f4c9a093e25f976d4bf84d4e050cb8f9281b2cc1be576"
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
    url "https://files.pythonhosted.org/packages/ea/06/cf1564dcc2e2261c8c8c6c05628dc8b418943bdae2a4e58640ceb2f770fa/platformdirs-4.11.5.tar.gz"
    sha256 "e8b31f4f8bcbbedef91a6b57a706255e4f148d2a4e01648382a0a47342539173"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "texastoast" do
    url "https://files.pythonhosted.org/packages/32/c3/a1cd1cb1f0a3c95f3f20cf8a7ae661107b605b3bbdfeaad39558d3448662/texastoast-0.11.0.tar.gz"
    sha256 "0af1ce24da3092c5c8ffa402bd110450fb0cc0f977a5c3f892745e2fd37258ef"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "uc-micro-py" do
    url "https://files.pythonhosted.org/packages/78/67/9a363818028526e2d4579334460df777115bdec1bb77c08f9db88f6389f2/uc_micro_py-2.0.0.tar.gz"
    sha256 "c53691e495c8db60e16ffc4861a35469b0ba0821fe409a8a7a0a71864d33a811"
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
