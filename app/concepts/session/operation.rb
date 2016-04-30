module Session
  class SignIn < Trailblazer::Operation
    contract do
      attr_reader :user

      property :email, virtual: true
      property :password, virtual: true
      validates :email, :password, presence: true
      validate :password_ok?

      private
      def password_ok?
        return if email.blank? or password.blank? # TODO: test me.
        @user =  User.authenticate(email,password)
        errors.add(:password, "Wrong password.") unless @user
      end

      def persisted?
        false
      end
    end

    def process(params)
      validate(params[:session]) do |contract|
        @model = contract.user
      end
    end
  end

  require "reform/form/validation/unique_validator.rb"
  class SignUp < Trailblazer::Operation
    include Model
    model User, :create
    contract do
      property :email
      property :password
      property :confirm_password, virtual: true
      property :name
      property :surname
      validates :email, :password, :confirm_password, presence: true
      validates :password, length: {minimum: 3}
      # validates :email,  email: true
      # validates :email, unique: true
      validate :password_ok?

      def password_ok?
        return unless email and password
        return if password == confirm_password
        errors.add(:password, "passwords don't match")
      end
    end

    def process(params)
      validate(params[:user]) do
        contract.save
      end
    end
  end

  class SignOut < Trailblazer::Operation
    def process(params)
    end
  end
end