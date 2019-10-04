class ScholarsController < ApplicationController
  before_action :set_scholar, only: [:show, :edit, :update, :destroy]

  # GET /scholars
  # GET /scholars.json
  def index
    @scholars = Scholar.all
  end

  # GET /scholars/1
  # GET /scholars/1.json
  def show
  end

  # GET /scholars/new
  def new
    @scholar = Scholar.new
  end

  # GET /scholars/1/edit
  def edit
  end

  # POST /scholars
  # POST /scholars.json
  def create
    @scholar = Scholar.new(scholar_params)

    respond_to do |format|
      if @scholar.save
        format.html { redirect_to @scholar, notice: 'Scholar was successfully created.' }
        format.json { render :show, status: :created, location: @scholar }
      else
        format.html { render :new }
        format.json { render json: @scholar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholars/1
  # PATCH/PUT /scholars/1.json
  def update
    respond_to do |format|
      if @scholar.update(scholar_params)
        format.html { redirect_to @scholar, notice: 'Scholar was successfully updated.' }
        format.json { render :show, status: :ok, location: @scholar }
      else
        format.html { render :edit }
        format.json { render json: @scholar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholars/1
  # DELETE /scholars/1.json
  def destroy
    @scholar.destroy
    respond_to do |format|
      format.html { redirect_to scholars_url, notice: 'Scholar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholar
      @scholar = Scholar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholar_params
      params.require(:scholar).permit(:first_name, :last_name, :region_of_study, :primary_country_of_residence, :title, :affiliation, :email, :mailing_address, :phone_fax_numbers, :website, :countries_of_specialization, :education, :research_interests, :teaching_interests, :publications, :keywords, :optional_message, :submitter_email)
    end
end
