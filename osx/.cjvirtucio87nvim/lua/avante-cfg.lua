require('avante_lib').load()
require("avante").setup(
  {
    build = "make BUILD_FROM_SOURCE=true",
    provider = "claude",
    behavior = {
      auto_suggestions = false,
      enable_cursor_planning_mode = true,
    },
    rag_service = {
      enabled = false,
      llm = {
        endpoint = "https://ai-gateway.zende.sk/v1",
      },
      embed = {
        endpoint = "https://ai-gateway.zende.sk/v1",
      },
      host_mount = vim.loop.cwd(),
    },
    providers = {
      openai = {
        endpoint = "https://ai-gateway.zende.sk/v1",
        model = "o3-mini",
        extra_request_body = {
          max_completion_tokens = 4093,
        }
      }
    }
  }
)

