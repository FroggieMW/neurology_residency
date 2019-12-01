class InterviewsController < ApplicationController
  before_action :current_user_must_be_interview_interviewee, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_interview_interviewee
    interview = Interview.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == interview.interviewee
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @interviews = Interview.page(params[:page]).per(10)

    render("interview_templates/index.html.erb")
  end

  def show
    @interview = Interview.find(params.fetch("id_to_display"))

    render("interview_templates/show.html.erb")
  end

  def new_form
    @interview = Interview.new

    render("interview_templates/new_form.html.erb")
  end

  def create_row
    @interview = Interview.new

    @interview.residency_program_id = params.fetch("residency_program_id")
    @interview.interviewee_id = params.fetch("interviewee_id")
    @interview.interview_date = params.fetch("interview_date")

    if @interview.valid?
      @interview.save

      redirect_back(:fallback_location => "/interviews", :notice => "Interview created successfully.")
    else
      render("interview_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_residency_program
    @interview = Interview.new

    @interview.residency_program_id = params.fetch("residency_program_id")
    @interview.interviewee_id = params.fetch("interviewee_id")
    @interview.interview_date = params.fetch("interview_date")

    if @interview.valid?
      @interview.save

      redirect_to("/residency_programs/#{@interview.residency_program_id}", notice: "Interview created successfully.")
    else
      render("interview_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @interview = Interview.find(params.fetch("prefill_with_id"))

    render("interview_templates/edit_form.html.erb")
  end

  def update_row
    @interview = Interview.find(params.fetch("id_to_modify"))

    @interview.residency_program_id = params.fetch("residency_program_id")
    
    @interview.interview_date = params.fetch("interview_date")

    if @interview.valid?
      @interview.save

      redirect_to("/interviews/#{@interview.id}", :notice => "Interview updated successfully.")
    else
      render("interview_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_interviewee
    @interview = Interview.find(params.fetch("id_to_remove"))

    @interview.destroy

    redirect_to("/users/#{@interview.interviewee_id}", notice: "Interview deleted successfully.")
  end

  def destroy_row_from_residency_program
    @interview = Interview.find(params.fetch("id_to_remove"))

    @interview.destroy

    redirect_to("/residency_programs/#{@interview.residency_program_id}", notice: "Interview deleted successfully.")
  end

  def destroy_row
    @interview = Interview.find(params.fetch("id_to_remove"))

    @interview.destroy

    redirect_to("/interviews", :notice => "Interview deleted successfully.")
  end
end
