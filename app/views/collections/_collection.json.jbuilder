json.extract! collector, :id

if collector.resource.present?
  case collector.resource.class.name.to_sym
    when :Pet
      json.pet do
        json.partial! 'pets/pet', pet: collector.resource
      end

    when :Post
      json.post do
        json.partial! 'posts/post', post: collector.resource
      end
  end
end
