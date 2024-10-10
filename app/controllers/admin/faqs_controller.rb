class Admin::FaqsController < ApplicationController
    before_action :set_faq, only: [:edit, :update, :destroy]
  
    def index
      @faqs = Faq.all
    end
  
    def new
      @faq = Faq.new
    end
  
    def create
      @faq = Faq.new(faq_params)
      if @faq.save
        redirect_to admin_faqs_path, notice: 'FAQ was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @faq.update(faq_params)
        redirect_to admin_faqs_path, notice: 'FAQ was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @faq.destroy
      redirect_to admin_faqs_path, notice: 'FAQ was successfully deleted.'
    end
  
    private
  
    def set_faq
      @faq = Faq.find(params[:id])
    end
  
    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
  end
  