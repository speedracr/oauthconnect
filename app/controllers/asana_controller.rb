class AsanaController < ApplicationController

  def projects
    wspace_id         = params[:workspace_id] 
    @projects         = current_user.asana.get_workspace_data(wspace_id, "projects")["data"]
    @workspace_name   = current_user.asana.get_workspace_name_from_id(params[:workspace_id].to_i)
  end


end
