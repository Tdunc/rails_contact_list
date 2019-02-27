class Contact < ApplicationRecord
    # Associations
    has_many :notes, dependent: :destroy
    has_one :address, dependent: :destroy
    #confirmation
    # validates :password, confirmation: true
    #inside of a form
    # <%= text_field :password, %>
    # <%= text_field :password_confirmation, %>

    validates :phone, length: {in 7..10}
    # validates :phone, length: {is 7}
    #numericality
    # validates :age, numericality: true
    # validates :age, numericality: {only_integer: true}
    validates: age, numericality: {greater_than_or_equal_to: 21, less_than_or_equal_to: 150}

    #presence
    validates :age, :phone, :email, :first_name, :last_name, presence: true, on: create

    #uniqueness
    validates :email, uniqueness: true, allow_nil: true

    #Validation Options
    # allow_nil - just empty
    # allow_blank - empty string
    # message
    # on 

    #Callbacks
    # before_validation
    # after_validation
    # before_save
    # after_save
    before_save :set_age

    private
      def set_age
        self.age = 21
      end

    #   serialize :cart, Array
    #   cart []
    
    # class methods
    def self.by_first_name
        order(:first_name)

    end
    # instance methods
    def full_name 
      "#{self.first_name} #{self.last_name}"
    end

end
