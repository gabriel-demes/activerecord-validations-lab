class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, {inclusion: ['Fiction', 'Fiction']}
    validate :clickbait

    def clickbait
        buzz_words = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
        buzz_words.each do |word|
            if buzz_words.none? {|word| word.match title}
                errors.add(:title, "must be clickbait")
            end
        end
    end

end
