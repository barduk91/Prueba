module Exceptions
	
	#User
	class NoSuchPadrinoCode < StandardError;end
	class InvalidPassword < StandardError;end
	class DuplicateEmail < StandardError;end
	class NoSuchUser < StandardError;end


	#Company
	class PasswordsDontMatch < StandardError;end

	#Email
	class MissedEmailParams < StandardError;end
	class ErrorSendingEmail < StandardError;end


end