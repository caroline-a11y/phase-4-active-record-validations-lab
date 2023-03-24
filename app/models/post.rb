class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
      unless record.title =~ /(Won't Believe|Secret|Top \d|Guess)/
        record.errors[:title] << "must be clickbait-y"
      end
    end
  end
  
class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  end
