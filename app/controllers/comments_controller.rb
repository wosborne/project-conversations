class CommentsController < ProjectsController

  def create
    comment = Comment.create(comment_params.merge(user: current_user))
    
    project.add_conversation_node(comment)

    redirect_to project_path(project), notice: "Comment added"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def project
    @project ||= Project.find(params[:project_id])
  end
end
