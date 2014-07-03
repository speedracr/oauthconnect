class PagesController < ApplicationController

  def home
  end

  def task
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      # params.require(:name).permit(:workspace, :assignee)
    end
end