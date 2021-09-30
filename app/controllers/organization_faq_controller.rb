class OrganizationFaqController < ApplicationController
  def index
    @current_org_faq = current_organization.organization_faqs
  end

  def create
    @organization_faq = OrganizationFaq.new(organization_faq_params)
    if @organization_faq.save
      redirect_to organization_faq_index_path, notice: "FAQ successfully added"
    else
      redirect_to organization_faq_index_path, error: "FAQ creation did not succeed; please try again"
    end
  end

  def destroy
    if current_organization.organization_faqs.find(params[:id]).destroy
      redirect_to organization_faq_index_path, notice: "FAQ successfully deleted"
    else
      redirect_to organization_faq_index_path, notice: "Deleting the FAQ did not succeed; please try again"
    end
  end

  def new
    @organization_faq = OrganizationFaq.new
  end

  private

  def organization_faq_params
    params.require(:organization_faq).permit(:organization_id, :question, :answer)
  end
end
