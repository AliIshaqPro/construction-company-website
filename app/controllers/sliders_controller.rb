class SlidersController < ApplicationController
    before_action :set_slider, only: [:show, :edit, :update, :destroy]
  
    def index
      @sliders = Slider.all
    end
  
    def show
    end
  
    def new
      @slider = Slider.new
    end
  
    def create
      @slider = Slider.new(slider_params)
      if @slider.save
        redirect_to sliders_path, notice: 'Slider was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @slider.update(slider_params)
        redirect_to sliders_path, notice: 'Slider was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @slider.destroy
      redirect_to sliders_path, notice: 'Slider was successfully destroyed.'
    end
  
    private
  
    def set_slider
      @slider = Slider.find(params[:id])
    end
  
    def slider_params
      params.require(:slider).permit(:title, :description, :image)
    end
  end
  