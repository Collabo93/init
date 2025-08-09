local settings = {
    start_dir = vim.fn.expand("~/AppData/local/nvim"),
    project_dirs = {
        os.getenv("LocalAppData") .. "/nvim",
        -- os.getenv("USERPROFILE") .. "/Documents",
    },
    undotree_dir = os.getenv("USERPROFILE") .. "\\.vim\\undodir",
}
return settings
