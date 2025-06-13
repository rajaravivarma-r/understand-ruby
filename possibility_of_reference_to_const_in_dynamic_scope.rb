module Auth
  USER_KEY = 'base_user'

  def print_namespaced_auth_key
    puts self.class::USER_KEY
  end

  def print_unnamespaced_auth_key
    puts USER_KEY
  end
end

class OAuth
  include Auth

  USER_KEY = 'oauth_user'
end

class BasicAuth
  include Auth
end

oauth = OAuth.new
puts 'Printing from OAuth'
oauth.print_namespaced_auth_key # => oauth_user
oauth.print_unnamespaced_auth_key # => base_user

puts
basic_auth = BasicAuth.new
puts 'Printing from BasicAuth'
basic_auth.print_namespaced_auth_key # => base_user
basic_auth.print_unnamespaced_auth_key # => base_user
