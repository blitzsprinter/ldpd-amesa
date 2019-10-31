class PendingScholarsController < ApplicationController
  before_action :verify_logged_in_with_admin_privs
  before_action :set_scholar, only: [:show, :edit, :update, :destroy]
  before_action :set_sort_direction, only: [:index]

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
    @pending_scholars = Scholar.all.where("approved = ?", false).order(sort_order).page params[:page]
  end

  # GET /scholars/1
  # GET /scholars/1.json
  def show
    Rails.logger.warn('!!!!!!!!!! PendingScholarsController#show !!!!!!!!!!')
  end

  # GET /scholars/new
  def new
    Rails.logger.warn('!!!!!!!!!! PendingScholarsController#new !!!!!!!!!!')
  end

  # GET /scholars/1/edit
  def edit
        Rails.logger.warn((current_user ? "(uid: #{current_user.uid}) " : '(no user logged in) ') +
                          "Reviewing Pending Scholar (PendingScholarsController#edit): " +
                          "id: #{@pending_scholar.id}; Name: #{@pending_scholar.last_name}, #{@pending_scholar.first_name}; Approved: #{@pending_scholar.approved}")
  end

  # POST /scholars
  # POST /scholars.json
  def create
    Rails.logger.warn('!!!!!!!!!! PendingScholarsController#create !!!!!!!!!!')
  end

  # PATCH/PUT /scholars/1
  # PATCH/PUT /scholars/1.json
  def update
    Rails.logger.warn('!!!!!!!!!! PendingScholarsController#update !!!!!!!!!!')
  end

  # DELETE /scholars/1
  # DELETE /scholars/1.json
  def destroy
    Rails.logger.warn('!!!!!!!!!! PendingScholarsController#destroy !!!!!!!!!!')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholar
      @pending_scholar = Scholar.find(params[:id])
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
      params.require(:scholar).permit(:first_name, :last_name, :region_id, :country_id, :title, :affiliation, :email, :mailing_address, :phone_fax_numbers, :website, :countries_of_specialization, :education, :research_interests, :teaching_interests, :publications, :keywords, :optional_message, :submitter_email)
    end
end
