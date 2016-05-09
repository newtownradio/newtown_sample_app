module CommentsHelper
end

<%= link_to 'Destroy', comment, method: :delete, data: { confirm: 'Are you sure?' } %>