local home = vim.env.HOME

require("chatgpt").setup(
  {
    openai_params = {
      model = "gpt-4o",
    },
    api_key_cmd = home .. '/.secrets/openai/token.sh',
    api_host_cmd = home .. '/.secrets/openai/host.sh',
    api_type_cmd = 'echo -n openai',
  }
)
