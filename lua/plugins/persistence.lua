return {
    "folke/persistence.nvim",
    opts = {
        -- Don't save these buffer types in the session
        need = 1,
        pre_save = function()
            -- Close log/temp buffers before saving session
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local name = vim.api.nvim_buf_get_name(buf)
                if name:match("%.log$") then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end
        end,
    },
}
