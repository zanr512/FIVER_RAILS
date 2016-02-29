class Link < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
    
    has_attached_file :image, styles: {  large: "600x600>", medium: "300x300>", thumb: "100x100#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    
    def score
        self.get_upvotes.size - self.get_downvotes.size
    end
    
end
