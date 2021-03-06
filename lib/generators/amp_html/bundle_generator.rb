require 'rails/generators/base'
require 'thor'

module AmpHtml
    module Generators

        class BundleGenerator < Rails::Generators::Base

            desc 'Bundle all amp-html generators.'


            class_option :split, desc: 'Keep an application layout without AMP', type: :boolean, default: false, aliases: '-s'
            class_option :format, desc: 'Set the views format. Defaults to `html`', type: :string, aliases: '-f'


            # CONFIGURATION
            class_option :name, desc: 'Set the name of your app', type: :string, default: "Hello AMP", aliases: '-n'


            # ASSETS
            class_option :stylesheets, desc: 'Generate stylesheet assets', type: :boolean, default: false, aliases: '-st'


            # COMPONENTS
            class_option :all, desc: 'Install all AMP-HTML components', type: :boolean, default: false, aliases: '-a'

            class_option :analytics, desc: 'Install the AMP-HTML Analytics Component', type: :boolean, default: false
            class_option :iframe, desc: 'Install the AMP-HTML Iframe Component', type: :boolean, default: false
            class_option :notifications, desc: 'Install the AMP-HTML Notifications Component', type: :boolean, default: false
            class_option :anim, desc: 'Install the AMP-HTML Animated Images Component', type: :boolean, default: false
            class_option :ad, desc: 'Install the AMP-HTML Advertisements Component', type: :boolean, default: false
            class_option :social, desc: 'Install the AMP-HTML Social Component', type: :boolean, default: false
            class_option :javascript, desc: 'Install the AMP-HTML Javascript Component', type: :boolean, default: false
            class_option :service_worker, desc: 'Install the AMP-HTML Service Worker Component', type: :boolean, default: false
            class_option :lists, desc: 'Install the AMP-HTML Lists Component', type: :boolean, default: false



            def run_generators
                generate "amp_html:install#{ ' -s' if options[:split] }#{ ' -f ' + options[:format] if options[:format] }#{ ' -n ' if options[:name] }'#{ options[:name] if options[:name] }'#{ ' -a' if options[:all] }#{ ' --anim' if options[:anim] }#{ ' --ad' if options[:ad] }#{ ' --iframe' if options[:iframe] }#{ ' --analytics' if options[:analytics] }#{ ' --notifications' if options[:notifications] }#{ ' --social' if options[:social] }"
                generate "amp_html:helpers#{ ' -s' if options[:split] }"
                generate "amp_html:views#{ ' -s' if options[:split] }#{ ' -f ' + options[:format] if options[:format] }#{ ' -a' if options[:all] }#{ ' --analytics' if options[:analytics] }"
                generate "amp_html:assets#{ ' -st' if options[:stylesheets] }"
                generate "amp_html:components#{ ' -s' if options[:split] }#{ ' -f ' + options[:format] if options[:format] }#{ ' -a' if options[:all] }#{ ' --anim' if options[:anim] }#{ ' --ad' if options[:ad] }#{ ' --iframe' if options[:iframe] }#{ ' --analytics' if options[:analytics] }#{ ' --notifications' if options[:notifications] }#{ ' --social' if options[:social] }#{ ' --javascript' if options[:javascript] }"
            end

        end

    end
end
