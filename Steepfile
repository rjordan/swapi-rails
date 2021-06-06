# frozen_string_literal: true

target :app do
  signature "sig"
  repo_path "vendor/rbs/gem_rbs_collection/gems"

  check "app"

  ignore "app/graphql"

  library "pathname", "logger", "mutex_m", "date", "monitor",
          "singleton", "tsort", "activesupport", "actionpack",
          "activejob", "activemodel", "actionview", "activerecord",
          "railties"
end
