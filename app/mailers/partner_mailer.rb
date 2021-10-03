class PartnerMailer < ApplicationMailer
  default from: "info@humanessentials.app"

  def recertification_request(partner:)
    @partner = partner

    mail to: partner.email, subject: "[Action Required] Please Update Your Agency Information"
  end

  def application_approved(partner:)
    @partner = partner
    @organization = partner.organization

    mail to: partner.email, subject: "Application Approved"
  end
end
