# frozen_string_literal: true

DEFAULT_ERRORS = [StandardError, RuntimeError].freeze

def rescue_like
  yield
rescue *DEFAULT_ERRORS => e
  puts e.class
end

rescue_like { raise StandardError }
rescue_like { raise RuntimeError }
# rescue_like StandardError, RuntimeError => e # Doesn't work
