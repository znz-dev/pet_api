json.comment do
  if @comment.present?
    json.partial! 'comments/comment', comment: @comment
  else
    json.nil!
  end
end