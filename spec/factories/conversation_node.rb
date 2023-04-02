FactoryBot.define do
  factory :conversation_node do
    association :project

    factory :comment_node do
      conversationable factory: :comment
    end

    factory :status_node do
      conversationable factory: :status
    end
  end
end
