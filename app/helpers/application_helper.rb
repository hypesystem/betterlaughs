require 'uri'

module ApplicationHelper
    def valid_url? url
        !!URI.parse(url)
    rescue URI::InvalidURIError
        false
    end

    def url_domain url
        host = URI.parse(url).host.downcase
        host.start_with?('www.') ? host[4..-1] : host
    end
end
