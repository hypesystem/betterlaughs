module LaughsHelper
    def get_content_type_from_headers headers
        m = /Content\-Type:([^\\;"]*)/.match(headers)
        m[1].strip
    end

    def raw_img_url laugh
        url_for :controller => 'laughs', :action => 'raw', :id => laugh.id
    end
end
