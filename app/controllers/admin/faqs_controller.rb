class Admin::FaqsController < ApplicationController
  def index
    @faqs = Faq.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      redirect_to admin_faqs_path
    else
      render :new
    end
  end


  def show
    @faq = Faq.find(params[:id])
  end


  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update(faq_params)
      redirect_to admin_faqs_path
    else
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to admin_faqs_path
  end


    private 
      def faq_params
        params.require(:faq).permit(:question, :answer)
      end
end
