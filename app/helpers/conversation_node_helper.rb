module ConversationNodeHelper
  def format_node_content(node)
    if node.conversationable.class.name == "Status"
      "Changed project status to: #{node.content}"
    else
      node.content
    end
  end
end
