class CommentsController < ProjectsController

  def create
    Comment.create(
      comment_params.merge(
        user_id: current_user.id,
        conversation_id: project.conversation.id
      )
    )

    redirect_to project_path(project), notice: "Comment added"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def project
    @project ||= Project.includes(:conversation).find(params[:project_id])
  end
end
