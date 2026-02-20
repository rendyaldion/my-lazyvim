return {
  {
    "nvim-java/nvim-java",
    enabled = false,
  },

  {
    "mason-org/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      for _, pkg in ipairs({ "jdtls", "java-debug-adapter", "java-test" }) do
        if not vim.tbl_contains(opts.ensure_installed, pkg) then
          table.insert(opts.ensure_installed, pkg)
        end
      end
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    optional = true,
    opts = function(_, opts)
      local java8_home = "/Users/sabrina/Library/Java/JavaVirtualMachines/corretto-1.8.0_482/Contents/Home"
      local java21_home = "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
      local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
      local lombok_jar = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

      if vim.fn.filereadable(jdtls_bin) == 1 and vim.fn.filereadable(java21_home .. "/bin/java") == 1 then
        opts.cmd = { jdtls_bin, "--java-executable", java21_home .. "/bin/java" }

        if vim.fn.filereadable(lombok_jar) == 1 then
          table.insert(opts.cmd, "--jvm-arg=-javaagent:" .. lombok_jar)
          table.insert(opts.cmd, "--jvm-arg=-Xbootclasspath/a:" .. lombok_jar)
        end
      end

      opts.root_dir = function(path)
        return vim.fs.root(path, {
          ".git",
          ".project",
          ".classpath",
          "mvnw",
          "gradlew",
          "pom.xml",
          "build.gradle",
          "build.gradle.kts",
          "settings.gradle",
          "settings.gradle.kts",
          "build.xml",
        }) or vim.uv.cwd()
      end

      local runtimes = {}
      if vim.fn.filereadable(java8_home .. "/bin/java") == 1 then
        table.insert(runtimes, { name = "JavaSE-1.8", path = java8_home, default = true })
      end
      if vim.fn.filereadable(java21_home .. "/bin/java") == 1 then
        table.insert(runtimes, { name = "JavaSE-21", path = java21_home })
      end

      local java_cfg = {
        configuration = {
          updateBuildConfiguration = "automatic",
        },
        maven = {
          downloadSources = true,
        },
        import = {
          maven = {
            enabled = true,
          },
        },
        contentProvider = {
          preferred = "fernflower",
        },
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
        },
      }
      if #runtimes > 0 then
        java_cfg.configuration.runtimes = runtimes
      end

      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = java_cfg,
      })
    end,
  },
}
