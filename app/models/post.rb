class Post < ApplicationRecord
    validates :title, presence: true
    validate :clickbait_title 
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:%w(Fiction Non-Fiction)}

    def clickbait_title
        unless title.match?(/"Won't Believe"/)
            errors.add(:title, "Title must be clickbait")
        end
    end
end
