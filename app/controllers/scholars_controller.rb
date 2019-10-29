class ScholarsController < ApplicationController
  before_action :verify_logged_in_with_admin_privs, only: [:update, :destroy]
  before_action :set_scholar, only: [:show, :edit, :update, :destroy]
  before_action :set_sort_direction, only: [:index, :by_region_of_study]

  def search
    @search_term = params[:search_term]
    @scholars = Scholar.search(@search_term)
  end

  def gcssearch
  end

  def by_region_of_study
    sort_order = params[:sort] || 'last_name ASC'
    # Note: all bools indicating whether sort order is ascending or not are
    # always reset to true before calling the by_region_of_study action
    case sort_order
    when 'last_name ASC'
      @last_name_sort_ascend = false
      @last_name_header_class = 'asc'
    when 'last_name DESC'
      @last_name_header_class = 'desc'
    when 'first_name ASC'
      @first_name_sort_ascend = false
      @first_name_header_class = 'asc'
    when 'first_name DESC'
      @first_name_header_class = 'desc'
    when 'region_id ASC'
      @region_of_study_sort_ascend = false
      @region_of_study_header_class = 'asc'
    when 'region_id DESC'
      @region_of_study_header_class = 'desc'
    when 'country_id ASC'
      @primary_country_of_residence_sort_ascend = false
      @primary_country_of_residence_header_class = 'asc'
    when 'country_id DESC'
      @primary_country_of_residence_header_class = 'desc'
    end
    regions_of_study = ['Africa', 'Middle East', 'South Asia'].freeze
    @scholars_in_region_of_study =
      Scholar.where("approved = ?", true).where("region_id = '#{params[:id]}'").order(sort_order).page params[:page]
  end

  # GET /scholars
  # GET /scholars.json
  def index
    sort_order = params[:sort] || 'last_name ASC'
    # Note: all bools indicating whether sort order is ascending or not are
    # always reset to true before calling the index action
    case sort_order
    when 'last_name ASC'
      @last_name_sort_ascend = false
      @last_name_header_class = 'asc'
    when 'last_name DESC'
      @last_name_header_class = 'desc'
    when 'first_name ASC'
      @first_name_sort_ascend = false
      @first_name_header_class = 'asc'
    when 'first_name DESC'
      @first_name_header_class = 'desc'
    when 'region_id ASC'
      @region_of_study_sort_ascend = false
      @region_of_study_header_class = 'asc'
    when 'region_id DESC'
      @region_of_study_header_class = 'desc'
    when 'country_id ASC'
      @primary_country_of_residence_sort_ascend = false
      @primary_country_of_residence_header_class = 'asc'
    when 'country_id DESC'
      @primary_country_of_residence_header_class = 'desc'
    end
    @scholars = Scholar.all.where("approved = ?", true).order(sort_order).page params[:page]
    # @scholars = Scholar.all.where("approved = ?", true)
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
        format.html { redirect_to scholars_url,
                                  notice: 'Thank you for submitting a new scholar entry. Your entry is awaiting approval by an administrator.' }
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
        format.html { redirect_to pending_scholars_url, notice: 'The scholar has been approved.' }
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
      format.html { redirect_to scholars_url, notice: 'Scholar deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholar
      @scholar = Scholar.find(params[:id])
    end
    def set_sort_direction
      @last_name_sort_ascend =
        @first_name_sort_ascend =
        @region_of_study_sort_ascend =
        @primary_country_of_residence_sort_ascend = true
      @last_name_header_class =
        @first_name_header_class =
        @region_of_study_header_class =
        @primary_country_of_residewnce_header_class = nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholar_params
      params.require(:scholar).permit(:first_name, :last_name, :region_id, :country_id, :title, :affiliation, :email, :mailing_address, :phone_fax_numbers, :website, :countries_of_specialization, :education, :research_interests, :teaching_interests, :publications, :keywords, :optional_message, :submitter_email, :approved, :search_term)
    end
end
