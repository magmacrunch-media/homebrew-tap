class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunch-media/magmacrunch"
  url "https://files.pythonhosted.org/packages/ac/b5/163ff7ae4809f256900b989f351a5c225598ba06874e7ff427fcd740e11b/magmacrunch-0.10.0.tar.gz"
  sha256 "0fb38b4e21e0dc92373671162c9d465f781e0acaa9c278c3ff8f4528965b397a"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  bottle do
    root_url "https://github.com/magmacrunch-media/homebrew-tap/releases/download/magmacrunch-0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "307c57679ba2322f8a40bfa9b8b8f26a8fe27dbd8887a4d5cc2a5ae118147b77"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0b945acd674f3679900b5fe772f0366467743744068f04c96b5c6d204bf30db2"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ba0275c05629b6d5519a6edd98b3145e2bf9a3745846c719e003dd68d173a46f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1dd00f3a777cedf99c2bb7f90b784935bc9747501f06c1b0b474599f69e61377"
  end

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "magmacrunch-backgammon" do
    url "https://files.pythonhosted.org/packages/5a/5c/2841354fb600388d5e480eddbf8c154f73ababc8e6e24c7ed31d63f13821/magmacrunch_backgammon-0.1.0.tar.gz"
    sha256 "5f5afc936e046d47610e1e7646aa588f5487609b4d2eef39e80740c41e1a22e5"
  end

  resource "magmacrunch-caldera" do
    url "https://files.pythonhosted.org/packages/0d/51/b259f72ae87cc43d85153e9b53b5f2c67bd678f1abb7f60b80557ade899b/magmacrunch_caldera-0.1.0.tar.gz"
    sha256 "084f6b60a53d2fa210f7851efd7023379ad3b653aa8687fa188916305f365b4d"
  end

  resource "magmacrunch-checkers" do
    url "https://files.pythonhosted.org/packages/1c/f5/f829c59ddb89ab190aa4d616c810bb55127108a78fc1c0c8a1517b50d2ca/magmacrunch_checkers-0.1.0.tar.gz"
    sha256 "c6320ade4b3f5fc40d68524a9e5c388fdd740949f97df86f815321695c353495"
  end

  resource "magmacrunch-chess" do
    url "https://files.pythonhosted.org/packages/22/8c/670345b7949e6d7b6a01424f3ee193bf0dfdf78439de251f2eb40cb11602/magmacrunch_chess-0.1.0.tar.gz"
    sha256 "b604e8076c794b9621f856abd0bde6c385f7a4fa8043156fb94810a9b74023b5"
  end

  resource "magmacrunch-chinese-checkers" do
    url "https://files.pythonhosted.org/packages/74/68/19b8e590c9f39ae1bb3489d918d0d3ee6efd1f872baa2070b30ccf221098/magmacrunch_chinese_checkers-0.1.0.tar.gz"
    sha256 "635fdc5aafaa1a46e781c25f5baadf3d6cdd8c2a3d3075714bfab2f4233ea10a"
  end

  resource "magmacrunch-cribbage" do
    url "https://files.pythonhosted.org/packages/8d/61/85e1d238b19e6fc7770aaeb1d98281e3135616e36464dd4cadfb3c7f4484/magmacrunch_cribbage-0.1.0.tar.gz"
    sha256 "0a341f057633957e59be1f6c312168bd52939b7b7d05cfeb6314392bb36f9354"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/31/69/8781bff28c377cf08e911bc5f534072a47ef09d6670b430be794b12947c2/magmacrunch_george_boole-0.5.2.tar.gz"
    sha256 "2831ba552be0b8f0b4c634cd41f06f6abbdc6d820ac879d570febc6c536e67ca"
  end

  resource "magmacrunch-jhc" do
    url "https://files.pythonhosted.org/packages/61/0c/6d07952f1d93736648154c7f899d19628adb4e29bd990ca3a960d4170fd4/magmacrunch_jhc-0.1.0.tar.gz"
    sha256 "ee6cd8c30b49c9913cf61514ce1578405331d4cb4b570a07b0013ea5c06d47e2"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/6a/19/24a8fdb424c419c87be7a8d8b8d4b604a57a1d5e486c60b6a59e82d9df18/magmacrunch_moonlight_drift-0.5.1.tar.gz"
    sha256 "24b32e09c9595ce119be0bb39befbfefa9cabc961f13b70012728e71680d0fc1"
  end

  resource "magmacrunch-nelikko" do
    url "https://files.pythonhosted.org/packages/83/43/74016db109a2d75fe4af6194aff8b44d7ce3e7805b335de072382218d523/magmacrunch_nelikko-0.1.0.tar.gz"
    sha256 "f1a89db91afab3d8a08002958dc4eadfea25ba5e10b1339d42fcfc7d3faef2fd"
  end

  resource "magmacrunch-roderick-tron" do
    url "https://files.pythonhosted.org/packages/03/25/0db89c0190987df7a220a59603ba53a02506fb228be3585bf28d3ff762db/magmacrunch_roderick_tron-0.1.0.tar.gz"
    sha256 "fbb1beb59cf64ba48056e849ade24248b49016c458574c3e7f0fa00d670c2b8c"
  end

  resource "magmacrunch-tarot" do
    url "https://files.pythonhosted.org/packages/4a/e2/58faf52cf938667970b4347bbd666062daab0b1d96bb8fffe7a6a4b28c22/magmacrunch_tarot-0.1.0.tar.gz"
    sha256 "b82643ac128fce3a5d56447dd2ceb3e9cad268676d1fa7697f154a0766def0cd"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/f5/47/d5b35fd05a3e7557a4d74797a06e6307b3a8aec2d58ee546a6e261291ff3/magmacrunch_thld-0.5.1.tar.gz"
    sha256 "4be16d2291e8a4dd1b8a66ed71f22f1335efe84ed2919b9403acabefe7752884"
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
    url "https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09/platformdirs-4.13.5.tar.gz"
    sha256 "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
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
