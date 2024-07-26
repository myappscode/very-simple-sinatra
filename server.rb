# frozen_string_literal: true

require "bundler/setup"
require "sinatra"

set :bind, ENV.fetch("BIND_ADDRESS", "0.0.0.0")

get "/" do
  "Hello world! This is the most simple app."
end
