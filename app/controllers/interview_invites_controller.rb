class InterviewInvitesController < ApplicationController
  def index
    @q = InterviewInvite.ransack(params[:q])
    @interview_invites = @q.result(:distinct => true).includes(:author, :residency_program).page(params[:page]).per(10)

    render("interview_invite_templates/index.html.erb")
  end

  def show
    @interview_invite = InterviewInvite.find(params.fetch("id_to_display"))

    render("interview_invite_templates/show.html.erb")
  end

  def new_form
    @interview_invite = InterviewInvite.new

    render("interview_invite_templates/new_form.html.erb")
  end

  def create_row
    @interview_invite = InterviewInvite.new

    @interview_invite.residency_program_id = params.fetch("residency_program_id")
    @interview_invite.invite_received_date = params.fetch("invite_received_date")
    @interview_invite.invitee_id = params.fetch("invitee_id")

    if @interview_invite.valid?
      @interview_invite.save

      redirect_back(:fallback_location => "/interview_invites", :notice => "Interview invite created successfully.")
    else
      render("interview_invite_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_residency_program
    @interview_invite = InterviewInvite.new

    @interview_invite.residency_program_id = params.fetch("residency_program_id")
    @interview_invite.invite_received_date = params.fetch("invite_received_date")
    @interview_invite.invitee_id = params.fetch("invitee_id")

    if @interview_invite.valid?
      @interview_invite.save

      redirect_to("/residency_programs/#{@interview_invite.residency_program_id}", notice: "InterviewInvite created successfully.")
    else
      render("interview_invite_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @interview_invite = InterviewInvite.find(params.fetch("prefill_with_id"))

    render("interview_invite_templates/edit_form.html.erb")
  end

  def update_row
    @interview_invite = InterviewInvite.find(params.fetch("id_to_modify"))

    @interview_invite.residency_program_id = params.fetch("residency_program_id")
    @interview_invite.invite_received_date = params.fetch("invite_received_date")
    @interview_invite.invitee_id = params.fetch("invitee_id")

    if @interview_invite.valid?
      @interview_invite.save

      redirect_to("/interview_invites/#{@interview_invite.id}", :notice => "Interview invite updated successfully.")
    else
      render("interview_invite_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_author
    @interview_invite = InterviewInvite.find(params.fetch("id_to_remove"))

    @interview_invite.destroy

    redirect_to("/users/#{@interview_invite.invitee_id}", notice: "InterviewInvite deleted successfully.")
  end

  def destroy_row_from_residency_program
    @interview_invite = InterviewInvite.find(params.fetch("id_to_remove"))

    @interview_invite.destroy

    redirect_to("/residency_programs/#{@interview_invite.residency_program_id}", notice: "InterviewInvite deleted successfully.")
  end

  def destroy_row
    @interview_invite = InterviewInvite.find(params.fetch("id_to_remove"))

    @interview_invite.destroy

    redirect_to("/interview_invites", :notice => "Interview invite deleted successfully.")
  end
end
