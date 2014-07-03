class TasksController < ApplicationController
  protect_from_forgery

  def show
  end


  def new
    @workspaces = current_user.asana.list_workspaces
  end

  def create
    name        = params[:name]
    workspace   = params[:workspace]
    assignee    = params[:assignee]
    notes       = params[:notes]
    current_user.asana.create_task(name, workspace: workspace, notes: notes)
    redirect_to root_path, notice: 'We have sent your task to Asana.'
  end

end
