class Admin::FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]
  before_action :authenticate_admin!

  # GET /admin/feedbacks or /admin/feedbacks.json
  def index
    @feedbacks = Feedback.includes(:client).all
  end

  # GET /admin/feedbacks/1 or /admin/feedbacks/1.json
  def show
  end

  # GET /admin/feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /admin/feedbacks/1/edit
  def edit
  end

  # POST /admin/feedbacks or /admin/feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to admin_feedback_path(@feedback), notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/feedbacks/1 or /admin/feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to admin_feedback_path(@feedback), notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/feedbacks/1 or /admin/feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to admin_feedbacks_path, status: :see_other, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def feedback_params
    params.require(:feedback).permit(:client_id, :content, :rating)
  end
end
