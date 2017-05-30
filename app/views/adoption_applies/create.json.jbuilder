json.adoption_apply do
  if @adoption_apply.present?
    json.partial! 'adoption_applies/adoption_apply', adoption_apply: @adoption_apply
  else
    json.nil!
  end
end
