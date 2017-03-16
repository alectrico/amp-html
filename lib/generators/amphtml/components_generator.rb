require 'rails/generators/base'
require 'thor'

module Amphtml
    module Generators

        class ComponentsGenerator < Rails::Generators::Base

            source_root File.expand_path("../../templates/components", __FILE__)
            desc "Install AMP-HTML components."


            class_option :format, desc: "Set the views format. Defaults to `amp`", type: :string, default: "amp", aliases: '-f'


            # COMPONENTS
            class_option :all, desc: "Install all AMP-HTML components", type: :boolean, default: false, aliases: '-a'

            class_option :analytics, desc: "Install amp-analytics tag", type: :boolean, default: false
            class_option :iframe, desc: "Install amp-iframe tag", type: :boolean, default: false
            class_option :notifications, desc: "Install amp-user-notification tag", type: :boolean, default: false
            class_option :anim, desc: "Install amp-anim tag", type: :boolean, default: false
            class_option :ad, desc: "Install amp-ad and amp-sticky-ad tag", type: :boolean, default: false
            class_option :social, desc: "Install social amp tags", type: :boolean, default: false




            def create_views
                template "views/_components.html.erb", "app/views/application/amp/_components.#{options[:format]}"
            end

            def create_helpers
                template "helpers/analytics_tag_helper.rb", "app/helpers/amp/components/analytics_tag_helper.rb" if options[:all] || options[:analytics]
                template "helpers/iframe_tag_helper.rb", "app/helpers/amp/components/iframe_tag_helper.rb" if options[:all] || options[:iframe]
                template "helpers/notification_tag_helper.rb", "app/helpers/amp/components/notification_tag_helper.rb" if options[:all] || options[:notifications]
                template "helpers/anim_tag_helper.rb", "app/helpers/amp/components/anim_tag_helper.rb" if options[:all] || options[:anim]
                template "helpers/ad_tag_helper.rb", "app/helpers/amp/components/ad_tag_helper.rb" if options[:all] || options[:ad]
                template "helpers/social_tag_helper.rb", "app/helpers/amp/components/social_tag_helper.rb" if options[:all] || options[:social]
            end

            def show_readme
                readme "README.md"
            end

        end

    end
end
