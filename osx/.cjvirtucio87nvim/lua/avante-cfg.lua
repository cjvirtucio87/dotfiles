require('avante_lib').load()
require("avante").setup(
  {
    build = "make BUILD_FROM_SOURCE=true",
    provider = "openai",
    behavior = {
      auto_suggestions = false,
      enable_cursor_planning_mode = true,
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

