class User < ApplicationRecord

    # Relationships
    has_many :group_members
    has_many :travel_groups, through: :group_members
    has_many :splits

    # Validations
    validates_presence_of :first_name, :last_name, :email, :phone, :base_currency, :password, :password_confirmation
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
    # phone can have dashes, spaces, dots and parens, but must be 10 digits
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
    validates_uniqueness_of :email
    validates :base_currency, inclusion: { in: %w[USD EUR GBP CHF AUD JPY TWD CNH] }
    validates_confirmation_of :password, on: :create, message: "does not match"
    validates_length_of :password, minimum: 8, message: "must be at least 8 characters long", allow_blank: true


    # # Callbacks
    # before_save :reformat_phone

    # Methods
    def name
        self.first_name + " " + self.last_name
    end

    # # Callback Methods
    # private
    # # We need to strip non-digits before saving to database
    # def reformat_phone
    #     phone = self.phone.to_s  # change to string in case input as all numbers 
    #     phone.gsub!(/[^0-9]/,"") # strip all non-digits
    #     self.phone = phone       # reset self.phone to new string
    # end

end
