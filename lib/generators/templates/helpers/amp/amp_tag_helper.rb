module ApplicationHelper
    module Amp::AmpTagHelper

        def amp_html_doctype(&block)
            doctype = tag("!doctype", html: "", open: true)
            # doctype = render html: "<!doctype html>".html_safe
            if block_given?
                html = content_tag("html", capture(&block), ⚡: "")
            else
                html = content_tag("html", nil, ⚡: "")
            end
            doctype + html
        end


        def amp_css(&block)
            if block_given?
                content_for :css, capture(&block)
            end
        end
        def amp_global_css(&block)
            warn "AMP-HTML WARNING: `amp_global_css` is deprecated and will be removed in amphtml 2.0 - use `amp_css` instead"
            if block_given?
                content_for :global_css, capture(&block)
            end
        end


        def amp_placeholder(name, options = {}, &block)
            options = options.symbolize_keys
            options[:placeholder] = ""

            if block_given?
                content_tag(name, capture(&block), options)
            else
                content_tag(name, nil, options)
            end
        end

        def amp_fallback(name, options = {}, &block)
            options = options.symbolize_keys
            options[:fallback] = ""

            if block_given?
                content_tag(name, capture(&block), options)
            else
                content_tag(name, nil, options)
            end
        end


        def amp_link(href, options = {})
            options = options.symbolize_keys
            options[:href] = href
            tag("link", options, open: true)
        end


        def amp_document_link(href = request.original_url)
            options = {}
            options[:href] = href
            options[:rel] = "amphtml"
            tag("link", options, open: true)
        end

        def canonical_document_link(href = request.original_url)
            options = {}
            options[:href] = href
            options[:rel] = "canonical"
            tag("link", options, open: true)
        end


        def amp_head(options = {})
            options = options.symbolize_keys

            head = render "application/amp/head", options: options

            resources = render "application/amp/resources"
            components = render "application/amp/components"

            head + resources + components
        end


        def amp_resources
            warn "AMP-HTML WARNING: `amp_resources` is deprecated and will be removed in amphtml 1.0 - use `amp_head` instead"
            resources = render "application/amp/resources"
            components = render "application/amp/components"
            resources + components
        end

    end
end
