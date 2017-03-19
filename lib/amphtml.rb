begin
    require 'rails'
rescue Exception => e
    warn "Ensure you are in a Ruby on Rails environment"
end

module Amphtml

    require 'amphtml/root'
    require 'amphtml/version'

    require 'amphtml/cli'

    require 'amphtml/configuration'
    require 'amphtml/configuration/help'

    require 'amphtml/test'
    require 'amphtml/validate'

    require 'amphtml/components/install'

    require 'amphtml/helpers/help'
    require 'amphtml/components/help'
    require 'amphtml/test/help'
    require 'amphtml/validate/help'

end
