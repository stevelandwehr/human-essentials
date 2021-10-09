module Partners
  class FaqsController < BaseController
    layout 'partners/application'

    def index
      @current_partner_faqs = current_partner.faqs
    end
  
    def create
      @partner_faq = Partners::Faq.new(partner_faq_params)
      if @partner_faq.save
        redirect_to partners_faqs_path, notice: "FAQ successfully added"
      else
        redirect_to partners_faqs_path, error: "FAQ creation did not succeed; please try again"
      end
    end
  
    def destroy
      if current_partner.faqs.find(params[:id]).destroy
        redirect_to partner_faqs_path, notice: "FAQ successfully deleted"
      else
        redirect_to partner_faqs_path, notice: "Deleting the FAQ did not succeed; please try again"
      end
    end
  
    def new
      @partner_faq = Partners::Faq.new
    end
  
    private
  
    def partner_faq_params
      params.require(:partners_faq).permit(:partner_id, :question, :answer)
    end
  end
end
