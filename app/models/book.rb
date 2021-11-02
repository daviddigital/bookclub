class Book < ApplicationRecord
    resourcify
    # enum status: [:in_stock, :out_of_stock, :banned]
    belongs_to :author
    has_many :book_genres, dependent: :destroy
    has_many :genres, through: :book_genres

    scope :find_in_stock, -> { where(status: "in_stock") }
    scope :find_out_of_stock, -> { where(status: "out_of_stock") }
    scope :find_banned, -> { where(status: "banned") }

    has_one_attached :cover, dependent: :purge

    validates :title, presence: { message: "Add title" }
    validates :date_published, presence: { message: "Add title" }
    # validates :past_date

    # def past_date
    #     if date_published >= Date.today
    #         errors.add(:date_published, "Date published must be in the past")
    #     end
    # end
end

