require_dependency 'iteasykit/application_controller'

module Iteasykit
  class FormsController < ApplicationController
    before_action :set_form, only: %i[show edit update destroy]

    # GET /forms
    def index
      @forms = Form.all
    end

    # GET /forms/1
    def show; end

    # GET /forms/new
    def new
      @form = Form.new
    end

    # GET /forms/1/edit
    def edit; end

    # POST /forms
    def create
      @form = Form.new(form_params)

      if @form.save
        fci_saver(@form, params)
        request.headers['Referer'] = request.headers['Referer'] + '?answer=success'
        redirect_back fallback_location: root_path
      else
        redirect_back fallback_location: root_path
      end
    end

    # PATCH/PUT /forms/1
    def update
      if @form.update(form_params)
        fci_saver(@form, params)
        redirect_back(fallback_location: root_path)
      else
        render :edit
      end
    end

    # DELETE /forms/1
    def destroy
      @form.destroy
      redirect_to forms_url, notice: 'Form was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
      @entity_type = @form.iteasykit_entity_type
    end

    # Only allow a trusted parameter "white list" through.
    def form_params
      params.require(:form).permit(:iteasykit_entity_type_id, :active, :sticky, :position, :group,
         :machine_name, :iteasykit_seomore_id, :slug, :calc, :humanizer_answer, :humanizer_question_id)
    end
  end
end
