module LaughsHelper
    def get_content_type_from_headers headers
        m = /Content\-Type:([^\\;"]*)/.match(headers)
        m[1].strip
    end
end
