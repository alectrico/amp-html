require "active_support/core_ext/array/extract_options"
require "active_support/core_ext/hash/keys"
require "action_view/helpers/asset_url_helper"
require "action_view/helpers/tag_helper"

module ActionView
    module Helpers
        module AssetTagHelper
            extend ActiveSupport::Concern

            include AssetUrlHelper
            include TagHelper

            def javascript_include_tag(*sources)
                warn "WARNING (AMP): external and internal scripts are not allowed."
                super
            end
            def stylesheet_link_tag(*sources)
                warn "WARNING (AMP): external and internal stylesheets are not allowed."
                super
            end


            def image_tag(source, options: {})
                options = options.symbolize_keys
                check_for_image_tag_errors(options)

                src = options[:src] = path_to_image(source, skip_pipeline: options.delete(:skip_pipeline))

                unless src.start_with?("cid:") || src.start_with?("data:") || src.blank?
                    options[:alt] = options.fetch(:alt) { image_alt(src) }
                end

                options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
                warn "WARNING (AMP): specify width and height of amp-img tags." unless options[:width] && options[:height]

                options[:layout] = "responsive" unless options[:layout] != "responsive"
                content_tag("amp-img", options) do
                    noscript_tag
                end
            end

            def amp_anim(source, options: {})
                options = options.symbolize_keys

                src = options[:src] = path_to_image(source, skip_pipeline: options.delete(:skip_pipeline))

                options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
                warn "WARNING (AMP): specify width and height of amp-anim tags." unless options[:width] && options[:height]

                options[:layout] = "responsive" unless options[:layout] != "responsive"

                if options[:placeholder]
                    options.delete(:placeholder)
                    content_tag("amp-anim", options) do
                        options.delete(:src)
                        amp_placeholder("amp-img", options)
                    end
                else
                    content_tag("amp-anim", options)
                end
            end

            def video_tag(*sources, fallback: "Your browser doesn’t support HTML5 video")
                options = sources.extract_options!.symbolize_keys
                public_poster_folder = options.delete(:poster_skip_pipeline)
                sources << options
                multiple_sources_tag_builder("amp-video", sources, fallback) do |tag_options|
                    tag_options[:poster] = path_to_image(tag_options[:poster], skip_pipeline: public_poster_folder) if tag_options[:poster]
                    tag_options[:width], tag_options[:height] = extract_dimensions(tag_options.delete(:size)) if tag_options[:size]
                    warn "WARNING (AMP): specify width and height of amp-video tags." unless tag_options[:width] && tag_options[:height]
                    tag_options[:layout] = "responsive" unless tag_options[:layout] != "responsive"
                end
            end

            def audio_tag(*sources, fallback: "Your browser doesn’t support HTML5 audio")
                multiple_sources_tag_builder("amp-audio", sources, fallback)
            end

            private

            def multiple_sources_tag_builder(type, sources, fallback)
                options       = sources.extract_options!.symbolize_keys
                skip_pipeline = options.delete(:skip_pipeline)
                sources.flatten!

                yield options if block_given?

                if sources.size > 1
                    content_tag(type, options) do
                        safe_join sources.map { |source| tag("source", src: send("path_to_#{type}", source, skip_pipeline: skip_pipeline)) }
                        if fallback.present?
                            content_tag("div", nil, {fallback: true}) do
                                content_tag("p", fallback)
                            end
                        end
                    end
                else
                    options[:src] = send("path_to_#{type}", sources.first, skip_pipeline: skip_pipeline)
                    content_tag(type, nil, options) do
                        if fallback.present?
                            content_tag("div", nil, {fallback: true}) do
                                content_tag("p", fallback)
                            end
                        end
                    end
                end
            end

        end
    end
end
