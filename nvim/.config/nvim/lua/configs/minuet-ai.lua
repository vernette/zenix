return {
  provider = "openai_fim_compatible",
  n_completions = 1,
  context_window = 512,
  provider_options = {
    openai_fim_compatible = {
      api_key = "TERM",
      name = "Ollama",
      end_point = "http://localhost:11434/v1/completions",
      model = "qwen2.5-coder:7b",
      optional = {
        max_tokens = 56,
        top_p = 0.9,
      },
    },
  },
}
