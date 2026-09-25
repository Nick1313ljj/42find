# 42find · 状态板（给 AI · 跨会话唯一接续点）

> 开工先读 `CLAUDE.md` + **`.42cog/` 四份**（`intent` · `real` · `cog` · `meta`）+ 本文件 + `state/memory/MEMORY.md`。
> **非轮规则：每轮有效工作必更新本文件**（倒序追加，新的在上，带日期与 commit hash）。
> 每完成一个可命名的逻辑单元存一次；破坏性操作之前也存一次。这是给你自己留的后路，不是给别人看的历史。

> ## ✅ 初始化完成（2026-09-26）
> `cog.md` 实体表已填（42find-core / 42find-cli 各占一行）；`meta.md` 身份与依赖已填；`real.md` 现实约束已填；`check-tools.sh` 补上 Rust 专属段（rustc/cargo/rustfmt/clippy 全 ✓）；新增 `rust-toolchain.toml`（stable channel）；新增 `.github/workflows/ci.yml`（fmt+clippy+build+test）。
> **待办**：① 远程仓库待配（`git remote add origin <地址>`）；② 跑 `42f-research` 定索引方案（tantivy vs 自建倒排）与依赖版本；③ 在 `src/42find-core` 里写第一个真实函数后才算出了第一件作品。

> ## 🦀 Rust workspace 就位（2026-09-18）
> `src/Cargo.toml`（workspace）+ `src/42find-core/`（lib crate）+ `src/42find-cli/`（bin crate，依赖 core）创建完毕。
> **下一步**：① 运行 `42f-research` 确定索引方案（tantivy / 自建倒排）和 CLI 框架（clap）；② 给远程仓库 push 一次。

> ## 🌱 系统开仓（2026-09-16 第一轮）
> `aias-meta-init` 生成六组骨架：① `README.md` `CLAUDE.md` `.42cog/` `specs/` ② `vault/` `notes/` `resources/` ③ `skills/` `scripts/` `plugin.json` ④ `src/` ⑤ `state/` `docs/` ⑥ `_build/` `_tmp/` `_archive/`（忽略）。
> **收敛方向**（草稿，待人确认）：见 `.42cog/intent.md`——**那句话只有一份，别抄到这里来**。
> **下一步**：确认收敛方向 → `42f-research` 找依据、排真相源权重 → 回来改这一句。方向第一版粗是正常的，四步是循环。
