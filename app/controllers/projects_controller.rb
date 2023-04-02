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
    status = Status.create(content: status_params.fetch(:status), user: current_user)
    project.add_conversation_node(status)

    redirect_to project_path(project), notice: "Status updated"
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def status_params
    params.require(:project).permit(:status)
  end

  def project
    @project ||= current_user.projects.includes(conversation_nodes: [conversationable: [:user]]).find(params[:id])
  end
end
