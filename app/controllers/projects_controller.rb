class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    project.add_user(current_user)

    redirect_to projects_path
  end

  def show
    @project = project
    @comment = Comment.new
  end

  def update
    project.update(project_status_params)

    redirect_to project_path(project), notice: "Status updated"
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def project_status_params
    params.require(:project).permit(:status)
  end

  def project
    @project ||= current_user.projects.includes(conversation: [:comments]).find(params[:id])
  end
end
