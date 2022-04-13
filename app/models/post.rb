class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait?

    CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
    ]


    def clickbait?
        if CLICKBAIT.none? { |el| el.match title }
            errors.add(:title, "must be clickbait")
        end
    end

end
