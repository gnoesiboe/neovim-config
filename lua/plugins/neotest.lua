return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "olimorris/neotest-phpunit",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-jest",
        },
        opts = function(_, opts)
            opts.adapters = opts.adapters or {}

            table.insert(
                opts.adapters,
                require("neotest-phpunit")({
                    phpunit_cmd = function()
                        return { vim.fn.expand("~/.config/nvim/scripts/phpunit-docker.sh") }
                    end,
                })
            )

            table.insert(opts.adapters, "neotest-vitest")

            local jest_script = vim.fn.expand("~/.config/nvim/scripts/jest-with-env.sh")

            table.insert(
                opts.adapters,
                require("neotest-jest")({
                    jestCommand = function(path)
                        local script = jest_script
                        local service_root = path:match("(.+/service)/")
                        if not service_root then
                            return script
                        end
                        local config
                        if path:match("%.integration%-spec%.ts$") then
                            config = service_root .. "/test/integration/config/jest.config.ts"
                        else
                            config = service_root .. "/test/unit/config/jest.config.js"
                        end
                        return script .. " --config " .. config
                    end,
                    cwd = function(path)
                        return path:match("(.+/service)/")
                    end,
                })
            )
        end,
    },
}
