class ScholarEditsController < ApplicationController
  before_action :set_scholar_edit, only: [:show, :edit, :update, :destroy]

  # GET /scholar_edits
  # GET /scholar_edits.json
  def index
    @scholar_edits = ScholarEdit.all
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
        scholar = Scholar.find(@scholar_edit.scholar_id)
        format.html { redirect_to scholar, notice: 'ScholarEdit was successfully created.' }
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
        format.html { redirect_to @scholar_edit, notice: 'ScholarEdit was successfully updated.' }
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
      format.html { redirect_to scholar_edits_url, notice: 'ScholarEdit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholar_edit
      @scholar_edit = ScholarEdit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholar_edit_params
      params.require(:scholar_edit).permit(:scholar_id, :first_name, :last_name, :region_id, :country_id, :title, :affiliation, :email, :mailing_address, :phone_fax_numbers, :website, :countries_of_specialization, :education, :research_interests, :teaching_interests, :publications, :keywords, :optional_message, :submitter_email)
    end
end
