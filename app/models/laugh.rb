class Laugh < ActiveRecord::Base
    def self.get_laughs(offset, num_items)
        Laugh.order(:created_at).offset(offset).limit(num_items)
    end
end
