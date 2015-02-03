require 'mail'

class Email

	#CONSTANS ERRORS
	ERROR_SENDING_EMAIL = "300"
	MISSED_EMAIL_PARAMS = "301"

	class << self
    attr_accessor :from, :to, :subject, :body
  end

	def initialize(from, to, subject, body)
	  @from = from
	  @to = to
	  @subject = subject
	  @body = body
	  @mail = build()
	end

	def build()
		(raise Exceptions::MissedEmailParams.new, MISSED_EMAIL_PARAMS) if 
			!@from || !@to || !@subject || !@body
		mail = Mail.new
	  mail[:from] = @from
	  mail[:to] = @to
	  mail[:subject] = @subject
	  mail[:body] = @body
		mail
	end

	def send
		@mail ? @mail.deliver! : (raise Exceptions::MissedEmailParams.new, MISSED_EMAIL_PARAMS)
	end

end