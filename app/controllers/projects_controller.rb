class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)
    project.add_user(current_user)

    redirect_to projects_path
  end

  def show
    @project = current_user.projects.includes(conversation: [:comments]).find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
