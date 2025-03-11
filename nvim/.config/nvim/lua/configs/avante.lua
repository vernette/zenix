return {
  provider = "openrouter",
  vendors = {
    openrouter = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      model = "google/gemini-2.0-pro-exp-02-05:free",
      api_key_name = "OPENROUTER_API_KEY",
    },
  },
}
