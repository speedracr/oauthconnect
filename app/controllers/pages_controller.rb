class PagesController < ApplicationController

  def home
  end

  def task
  end

  def createtask
    name        = params[:name]
    workspace   = params[:workspace]
    assignee    = params[:assignee]
    current_user.asana.create_task(name, workspace: workspace)
    redirect_to root_path, notice: 'We have sent your task to Asana.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      # params.require(:name).permit(:workspace, :assignee)
    end
end