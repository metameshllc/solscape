| Chapter | Issue Title  | Issue Status | Severity |
| ------------- | ------------- | ------------- | ------------- |
<% issues_ordered_with_links.each_with_index do |issue,index| %> | <% if standalone %>2<% else %>3<% end %>.<%= index+1 %> | [<%= issue["title"] %>](<%= issue["link"] %>) | <% if standalone %> **<%= issue["state"].to_s.downcase.capitalize %>** <% else %> <img height="30px" src="static-content/<%= issue["state"].to_s.downcase %>.png"/> <% end %>| <% if standalone %> **<%= issue["severity"].to_s.downcase.capitalize %>** <% else %> <img height="30px" src="static-content/<%=issue["severity"].to_s.downcase %>.png"/> <% end %>| 
<% end %>
