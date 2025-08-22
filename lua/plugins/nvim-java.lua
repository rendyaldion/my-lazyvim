return {
  "nvim-java/nvim-java",
  ft = "java",
  dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-jdtls" },
  config = function()
    local jdtls   = require("jdtls")
    local jsetup  = require("jdtls.setup")
    local lsputil = require("lspconfig.util")
    -- pcall(function() require("java").setup({}) end)

    local markers = { "pom.xml", "build.gradle", "mvnw", "gradlew", ".git" }
    local root    = jsetup.find_root(markers) or lsputil.root_pattern(unpack(markers))(vim.loop.cwd())
    if not root or root == "" then return end

    local parent = vim.fn.fnamemodify(root, ":h")
    local wspath = vim.fn.stdpath("state") .. "/jdtls/workspace/" .. (vim.fn.fnamemodify(parent, ":t") .. "-jdtls")

    local mason = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local launcher = vim.fn.glob(mason .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local cfg = mason .. "/config_mac" -- macOS

    local lombok = "/Users/rendyaldion/.m2/repository/org/projectlombok/lombok/1.18.30/lombok-1.18.30.jar"

    local cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-javaagent:" .. lombok,
      "-Xbootclasspath/a:" .. lombok,
      "--add-opens", "java.base/java.lang.reflect=ALL-UNNAMED",
      "-jar", launcher,
      "-configuration", cfg,
      "-data", wspath,
    }

    -- local style_uri = vim.uri_from_fname("/Users/rendyaldion/.idea/codeStyles/Java.xml")

    local settings = {
      java = {
        configuration = { updateBuildConfiguration = "automatic" },
        maven = { downloadSources = true },
        import = { maven = { enabled = true } },
        contentProvider = { preferred = "fernflower" },
        -- format = {
        --   settings = {
        --     url = style_uri,
        --     profile = "Default",
        --   },
        -- },
      },
    }

    local function on_attach(client, _)
      client.server_capabilities.documentFormattingProvider = false
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        jdtls.start_or_attach({
          cmd = cmd,
          root_dir = root,
          settings = settings,
          on_attach = on_attach,
        })
      end,
    })
  end,
}
