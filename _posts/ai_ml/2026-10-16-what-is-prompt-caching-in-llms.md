---
layout: post
title: "What is Prompt Caching in LLMs?"
date: 2026-10-16 00:00:00 +0530
categories: [AI/ML]
tags: [llm, prompt-caching, kv-cache, transformers, ai-agents, inference, distributed-systems]
description: "Prompt caching reuses model computation."
author: harshityadav95
published: true
math: true
---

![image.png](/assets/img/posts/prompt-caching-in-llms/image.png)

# TLDR;

[https://youtu.be/BfnQUKDmQIw](https://youtu.be/BfnQUKDmQIw)

## Engineering Deep Dive: Why Are We Paying for the Same Computation Again?

Imagine building an AI agent with 10,000 tokens of system instructions and tool definitions. A user sends a 500-token message. The agent calls the LLM, uses a tool, and calls the model again. Much of the same context gets sent repeatedly.

**Your agent is paying to process old information again and again.** Prompt caching addresses that redundant work.

### 1. The Context Snowball

An illustrative five-step agent workflow might look like this:

| API call | Input tokens |
| --- | --- |
| Initial request | 12,000 |
| Tool execution | 15,000 |
| Analysis | 20,000 |
| Another tool call | 26,000 |
| Final response | 32,000 |
| **Total** | **105,000** |

The final context is 32,000 tokens, but the complete workflow processes 105,000 input tokens. This is especially expensive for agents with large tool schemas and long tool-use loops.

### 2. What Is Actually Cached?

A Transformer uses an **attention mechanism** built from queries (Q), keys (K), and values (V):

$$
Attention(Q,K,V)=softmax\left(\frac{QK^T}{\sqrt{d_k}}\right)V
$$

A **KV cache** retains intermediate key and value tensors computed for earlier token positions in the model's attention layers. During generation, this avoids rebuilding those states for every new token.

**Prompt caching** allows eligible, matching prompt prefixes to reuse previously computed KV states across separate requests.

It does **not** cache the final answer. The model must still process new tokens and generate a new response.

> Redis caches application data. Prompt caching reuses model computation.
> 

![image.png](/assets/img/posts/prompt-caching-in-llms/image-1.png)

### 3. Why Prompt Order Matters

![image.png](/assets/img/posts/prompt-caching-in-llms/image-2.png)

### 4. The Economics

![image.png](/assets/img/posts/prompt-caching-in-llms/image-3.png)

### 5. The Distributed Systems Problem

![image.png](/assets/img/posts/prompt-caching-in-llms/image-4.png)

Imagine the first request reaches GPU A, where its KV cache is retained. The next request lands on GPU B. GPU B might not have that cache, so the same prefix can result in a miss.

That introduces familiar infrastructure challenges:

- **Cache locality:** Route requests to workers holding compatible states.
- **Memory pressure:** KV tensors can consume substantial GPU memory.
- **Eviction:** Choose which states to discard.
- **Retention:** Decide how long prefixes stay reusable.
- **Concurrency:** Multiple requests may arrive before the first cache entry is available.

For a hypothetical 32-layer model with eight KV heads, head dimension 128, FP16 KV tensors, and 16,000 cached tokens, the KV memory is approximately **1.95 GiB** before implementation-specific optimizations.

Caching saves compute but consumes resources. Identical prefixes do not guarantee hits.

### 6. Why a Cheaper Model Can Cost More

Suppose your agent has 100,000 tokens already cached on an expensive model.

To format JSON, you switch to a cheaper model. But KV states generally cannot be shared between different models, so the cheaper model may need to process the entire context again.

At illustrative rates:

- Expensive model, 100,000 cached input tokens at $0.50/M: **$0.05**
- Cheap model, 100,000 uncached input tokens at $1.00/M: **$0.10**

The nominally cheaper model costs twice as much *for the input portion of this example*.

A better design is to extract a compact 500-token task and send only that to the smaller model.

**Optimize total cost per task, not advertised price per token.**

### 7. Designing a Cache-Aware Agent

![image.png](/assets/img/posts/prompt-caching-in-llms/image-5.png)

The application constructs deterministic prompts and manages history. The inference provider generally manages its internal KV cache.

In production:

1. **Place stable prefixes first.** Keep instructions and tool schemas unchanged where possible.
2. **Make prompts deterministic.** Avoid random values and arbitrary schema ordering.
3. **Route with cache awareness.** Include cache reuse when comparing models.
4. **Manage context.** Summarize irrelevant history when a smaller prompt is better.
5. **Measure results.** Monitor cached input tokens, cache writes, effective cost, latency, and answer quality.

A useful metric is:

$$
CacheReadRatio=\frac{CachedInputTokens}{TotalInputTokens}
$$

But maximizing this ratio is not the goal. Huge cached contexts can still consume memory, slow some phases of inference, and dilute relevant information.

### 8. The Bigger Engineering Lesson

Backend engineers already understand caching database pages, HTTP responses, and static assets. Prompt caching is the same broad idea applied at a different layer: **reuse intermediate Transformer computation instead of rebuilding it**.

Its effectiveness depends on the workload, prompt structure, prefix stability, inference routing, and memory management.

Two AI agents can use the same model and tools while having dramatically different operating costs—not because one model is smarter, but because one system avoids redundant work.

**Prompt caching doesn't make an LLM smarter. It makes the infrastructure stop repeating computation.**

## Summary : Short

[https://www.youtube.com/shorts/mqnscMx8mUo?feature=share](https://www.youtube.com/shorts/mqnscMx8mUo?feature=share)

### Further Reading

- [OpenAI prompt caching documentation](https://developers.openai.com/api/docs/guides/prompt-caching)
- [Anthropic prompt caching documentation](https://platform.claude.com/docs/en/build-with-claude/prompt-caching)
- [Lessons from Building Claude Code: Prompt Caching Is Everything](https://claude.com/blog/lessons-from-building-claude-code-prompt-caching-is-everything)
- [Attention Is All You Need](https://arxiv.org/abs/1706.03762)
- [https://aiengg.dev/blog/what-is-prompt-caching-in-llms](https://aiengg.dev/blog/what-is-prompt-caching-in-llms)