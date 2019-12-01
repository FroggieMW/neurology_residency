class ResidencyProgramsController < ApplicationController
  def index
    @residency_programs = ResidencyProgram.all

    render("residency_program_templates/index.html.erb")
  end

  def show
    @residency_program = ResidencyProgram.find(params.fetch("id_to_display"))

    render("residency_program_templates/show.html.erb")
  end

  def new_form
    @residency_program = ResidencyProgram.new

    render("residency_program_templates/new_form.html.erb")
  end

  def create_row
    @residency_program = ResidencyProgram.new

    @residency_program.state = params.fetch("state")
    @residency_program.program_name = params.fetch("program_name")

    if @residency_program.valid?
      @residency_program.save

      redirect_back(:fallback_location => "/residency_programs", :notice => "Residency program created successfully.")
    else
      render("residency_program_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @residency_program = ResidencyProgram.find(params.fetch("prefill_with_id"))

    render("residency_program_templates/edit_form.html.erb")
  end

  def update_row
    @residency_program = ResidencyProgram.find(params.fetch("id_to_modify"))

    @residency_program.state = params.fetch("state")
    @residency_program.program_name = params.fetch("program_name")

    if @residency_program.valid?
      @residency_program.save

      redirect_to("/residency_programs/#{@residency_program.id}", :notice => "Residency program updated successfully.")
    else
      render("residency_program_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @residency_program = ResidencyProgram.find(params.fetch("id_to_remove"))

    @residency_program.destroy

    redirect_to("/residency_programs", :notice => "Residency program deleted successfully.")
  end
end
