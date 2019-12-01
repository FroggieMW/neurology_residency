Rails.application.routes.draw do
  # Routes for the Interview resource:

  # CREATE
  get("/interviews/new", { :controller => "interviews", :action => "new_form" })
  post("/create_interview", { :controller => "interviews", :action => "create_row" })

  # READ
  get("/interviews", { :controller => "interviews", :action => "index" })
  get("/interviews/:id_to_display", { :controller => "interviews", :action => "show" })

  # UPDATE
  get("/interviews/:prefill_with_id/edit", { :controller => "interviews", :action => "edit_form" })
  post("/update_interview/:id_to_modify", { :controller => "interviews", :action => "update_row" })

  # DELETE
  get("/delete_interview/:id_to_remove", { :controller => "interviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Residency program resource:

  # CREATE
  get("/residency_programs/new", { :controller => "residency_programs", :action => "new_form" })
  post("/create_residency_program", { :controller => "residency_programs", :action => "create_row" })

  # READ
  get("/residency_programs", { :controller => "residency_programs", :action => "index" })
  get("/residency_programs/:id_to_display", { :controller => "residency_programs", :action => "show" })

  # UPDATE
  get("/residency_programs/:prefill_with_id/edit", { :controller => "residency_programs", :action => "edit_form" })
  post("/update_residency_program/:id_to_modify", { :controller => "residency_programs", :action => "update_row" })

  # DELETE
  get("/delete_residency_program/:id_to_remove", { :controller => "residency_programs", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
