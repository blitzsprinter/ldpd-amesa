class NotificationMailer < ApplicationMailer
  default from: 'amesa@libraries.cul.columbia.edu'

  def pending_new_scholar
    mail(to: EMAILS[:new_scholar], subject: 'Pending New Scholar')
  end

  def pending_scholar_edit
    mail(to: EMAILS[:scholar_edit], subject: 'Pending Scholar Edit')
  end
end
