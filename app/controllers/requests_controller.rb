class RequestsController < ApplicationController
  respond_to :html, :js
  before_action :set_request, only: [:edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @request.update_attribute(:seen, true)
  end

  def new
    @request = Request.new
    @request.recipient_id = params[:recipient_id]
    @charge = Charge.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to root_url, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
    @request.send_notifications!
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:body, :sender_id, :recipient_id, :seen, :time, :stripe)
    end
end
