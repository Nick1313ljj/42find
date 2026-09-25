# 42find · 工具就绪检查（Windows PowerShell 版）
#
# 只看不装：报告有什么、缺什么、缺的怎么装。安装命令由你自己跑。
#
#   .\scripts\check-tools.ps1            检查
#   .\scripts\check-tools.ps1 --mirrors  顺带打印国内镜像配置

param([switch]$mirrors)

$missing = @()

function Check-Tool {
    param($cmd, $what, $how)
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        Write-Host ("  {0,-10} {1}" -f "✓ $cmd", $what)
    } else {
        Write-Host ("  {0,-10} {1,-28} -> {2}" -f "✗ $cmd", $what, $how)
        $script:missing += $cmd
    }
}

Write-Host "`n▸ 分发市场"
Check-Tool scoop    "Windows 包管理器"          "见 scoop.sh"
Check-Tool winget   "微软官方包管理器"           "新版 Windows 自带"
Check-Tool node     "JavaScript 运行时"          "scoop install nodejs"
Check-Tool npm      "JS 包索引入口"              "随 node 一起"
Check-Tool bun      "更快的那个 JS 入口"         "scoop install bun"
Check-Tool python   "Python 运行时"              "scoop install python"
Check-Tool pip      "Python 包索引入口"          "随 python 一起"
Check-Tool uv       "更快的那个 Python 入口"     "scoop install uv"

Write-Host "`n▸ 常用命令行工具"
Check-Tool git      "版本控制"                   "scoop install git"
Check-Tool rg       "全文检索（ripgrep）"        "scoop install ripgrep"
Check-Tool jq       "命令行处理 JSON"            "scoop install jq"
Check-Tool gitleaks "提交前扫密钥"               "scoop install gitleaks"
Check-Tool gh       "GitHub 命令行入口"          "scoop install gh"

Write-Host "`n▸ 本系统专属（42find · Rust）"
Check-Tool rustc    "Rust 编译器"                "rustup install stable"
Check-Tool cargo    "Cargo 包管理器"             "随 rustup 一起装"
Check-Tool rustfmt  "Rust 格式化"                "rustup component add rustfmt"
if (Get-Command cargo -ErrorAction SilentlyContinue) {
    $clippyOk = cargo clippy --version 2>$null
    if ($clippyOk) {
        Write-Host ("  {0,-10} {1}" -f "✓ clippy", "Rust lint")
    } else {
        Write-Host ("  {0,-10} {1,-28} -> {2}" -f "✗ clippy", "Rust lint", "rustup component add clippy")
        $missing += "clippy"
    }
} else {
    Write-Host ("  {0,-10} {1,-28} -> {2}" -f "✗ clippy", "Rust lint", "rustup component add clippy")
    $missing += "clippy"
}

Write-Host "`n▸ 第二谱系（对抗性评审）"
Check-Tool codex    "配 GPT 系"                  "见 OpenAI Codex 文档"
Check-Tool opencode "配 GLM 系"                  "见 OpenCode 文档"

Write-Host ""
if ($missing.Count -gt 0) {
    Write-Host "▸ 缺这些：$($missing -join ', ')"
    Write-Host "  只从官方或可信源装；装之前核一眼包名与维护状态。"
} else {
    Write-Host "▸ 都齐了。"
}

if ($mirrors) {
    Write-Host @"

▸ 国内镜像（装不上时的退路）

  npm      npm config set registry https://registry.npmmirror.com
  PyPI     pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  Rust     在 %USERPROFILE%\.cargo\config.toml 加：
             [source.crates-io]
             replace-with = "rsproxy"
             [source.rsproxy]
             registry = "https://rsproxy.cn/crates.io-index"

  地址会变，用前核一眼镜像站说明页，别照抄过期配置。
"@
}
