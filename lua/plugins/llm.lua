return {
    "huggingface/llm.nvim",
    opts = {
        model = "codellama:13b",
        backend = "ollama",
        url = "http://localhost:11434",
        request_body = {
            -- Modelfile options for the model you use
            options = {
                temperature = 0.2,
                top_p = 0.95,
            },
        },
        enable_suggestions_on_startup = true,
        enable_suggestions_on_files = { "*.py", "*.ts", "*.go", "*.lua" },
    },
}
