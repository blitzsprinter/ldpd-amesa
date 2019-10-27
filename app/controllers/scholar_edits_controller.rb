class ScholarEditsController < ApplicationController
  before_action	:verify_logged_in_with_admin_privs, except: [:new, :create]
  before_action :set_scholar_edit, only: [:show, :edit, :update, :destroy]
  before_action :set_sort_direction, only: [:index]

  # GET /scholar_edits
  # GET /scholar_edits.json
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
    @scholar_edits = ScholarEdit.all.order(sort_order).page params[:page]
  end

  # GET /scholar_edits/1
  # GET /scholar_edits/1.json
  def show
  end

  # GET /scholar_edits/new
  def new
    scholar = Scholar.find(params[:scholar_id])
    reject_attributes = ['id', 'created_at', 'updated_at']
    @scholar_edit = ScholarEdit.new(scholar.attributes.slice(*(ScholarEdit.attribute_names - reject_attributes)))
    @scholar_edit.scholar_id = scholar.id
  end

  # GET /scholar_edits/1/edit
  def edit
  end

  # POST /scholar_edits
  # POST /scholar_edits.json
  def create
    @scholar_edit = ScholarEdit.new(scholar_edit_params)

    respond_to do |format|
      if @scholar_edit.save
        format.html { redirect_to scholars_path,
                                  notice: 'Your scholar edit has been submitted successfully and is awaiting approval by an administrator.' }
        # format.html { redirect_to @scholar_edit, notice: 'ScholarEdit was successfully created.' }
        format.json { render :show, status: :created, location: @scholar_edit }
      else
        format.html { render :new }
        format.json { render json: @scholar_edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholar_edits/1
  # PATCH/PUT /scholar_edits/1.json
  def update
    respond_to do |format|
      if @scholar_edit.update(scholar_edit_params)
        scholar = Scholar.find(@scholar_edit.scholar_id)
        reject_attributes = ['id', 'scholar_id','created_at', 'updated_at']
        scholar.update(@scholar_edit.attributes.slice(*(ScholarEdit.attribute_names - reject_attributes)))
        @scholar_edit.destroy
        format.html { redirect_to scholar_edits_url,
                                  notice: "The scholar edit has been approved. The associated scholar's public-facing information has been updated." }
        format.json { render :show, status: :ok, location: @scholar_edit }
      else
        format.html { render :edit }
        format.json { render json: @scholar_edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholar_edits/1
  # DELETE /scholar_edits/1.json
  def destroy
    @scholar_edit.destroy
    respond_to do |format|
      format.html { redirect_to scholar_edits_url, notice: 'Scholar edit rejected.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholar_edit
      @scholar_edit = ScholarEdit.find(params[:id])
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
    def scholar_edit_params
      params.require(:scholar_edit).permit(:scholar_id, :first_name, :last_name, :region_id, :country_id, :title, :affiliation, :email, :mailing_address, :phone_fax_numbers, :website, :countries_of_specialization, :education, :research_interests, :teaching_interests, :publications, :keywords, :optional_message, :submitter_email)
    end
end
