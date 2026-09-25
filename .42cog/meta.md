# 42find — 项目身份

<meta>
  <document-id>42f-meta</document-id>
  <version>1.0.0</version>
  <project>42find</project>
  <type>Project Metadata</type>
  <created>2026-09-16</created>
</meta>

## Document Purpose

这个系统的**项目身份**：它是什么、归谁、在哪、跟谁交接。

**这里只描述事实，不定规矩。** 怎么干看 `CLAUDE.md`，产出该长什么样（含命名）看 `specs/`，
朝哪儿使劲看 `intent.md`，有哪些改不了的现实看 `real.md`。

---

<project-info>

## 身份

- **系统名**：42find ｜ **系统码**：`42f` ｜ **开仓**：2026-09-16
- **一句话定位**：本地全文检索 CLI——输入片段关键词，秒级返回排名前三的文件路径与摘要
- **负责人**：Nick1313ljj
- **状态**：在建

## 位置

- **作品区**：`src/` —— Rust workspace（`42find-core` lib crate + `42find-cli` bin crate）
- **远程仓库**：待配（见 `state/board.md`）
- **与默认六组的差异**：`src/` 含完整 Cargo workspace；`src/target/` 已加入 `.gitignore`

## 交接

```
用户本地文件系统 ──原料──▶  42find  ──排序结果 + 摘要──▶  终端 / 下游脚本
```

| | 是谁 | 交接什么 | 怎么交 |
|---|---|---|---|
| 上游 | 用户本地文件系统 | 待检索的文件 | 目录路径参数 |
| 下游 | 终端用户 / shell 脚本 | 匹配文件路径 + 摘要行 | stdout，可管道组合 |

## 依赖

| 依赖 | 版本 | 缺了会怎样 |
|---|---|---|
| rustc / cargo | stable（见 `rust-toolchain.toml`） | 无法编译，项目完全不可运行 |
| rustfmt | 随 rustup stable 装 | CI 格式检查报错 |
| clippy | 随 rustup stable 装 | CI lint 检查报错 |

**换台机器能不能跑起来，看这张表填得全不全。**

</project-info>

---

元数据变了就地改，不留历史——**历史在提交链里**。
