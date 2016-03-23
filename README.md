# DeepDevelop Table Builder

```
<%= table_for Article, @articles do |t| %>
  <%= t.column :title %>
  <%= t.column 'actions' do |article| %>
    <%= link_to 'Show', article %>
    <%= link_to 'Edit', edit_article_path(article) %>
    <%= link_to 'Destroy', article, method: :delete, remote: true %>
  <% end %>
<% end %>
```