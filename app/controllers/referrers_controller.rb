class ReferrersController < ApplicationController
  before_action :set_referrer, only: [:show, :edit, :update]

  def index
    load_referrers
    @referrer = Referrer.new
    respond_to do |format|
      format.html
      format.csv { send_data @referrers.to_csv }
    end
  end

  def create
    @referrer = Referrer.new(referrer_params)
    if @referrer.save
      redirect_to referrers_path, notice: 'Referrer was successfully created.'
    else
      flash.now[:alert] = 'Sorry! Referrer could not be created, please fix the errors and try again.'
      load_referrers
      render action: 'index'
    end
  end

  def edit
    load_referrers
    render 'index'
  end

  def update
    if @referrer.update_attributes(referrer_params)
      redirect_to referrers_path, notice: 'Referrer details were updated successfully.'
    else
      flash.now[:alert] = 'Sorry! Referrer details could not be updated, please fix the errors and try again.'
      load_referrers
      render action: 'index'
    end
  end

  def import
    Referrer.import(params[:file])
    redirect_to referrers_path, notice: 'Referrers imported.'
  end

  private
    def load_referrers
      @referrers = Referrer.order('id').all
    end

    def set_referrer
      @referrer = Referrer.find(params[:id])
    end

    def referrer_params
      params.require(:referrer).permit(:name)
    end
end
