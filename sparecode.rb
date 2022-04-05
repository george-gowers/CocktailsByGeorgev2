<%= simple_form_for @cocktail, url: mail_path, method: :get do |f| %>
      <%= f.input :name %>
      <%= f.input :email %>
      <%= f.submit 'Click for Cocktail!', class: "btn btn-primary" %>
    <% end %>
  </div>
