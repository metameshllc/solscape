| Severity  | Status | <% if !standalone %> Link | <% end %> Remediation Comment |
| ------------- | ------------- |<% if !standalone %>  ------------- |<% end %> ------------- |
| <% if standalone %> **<%= severity.downcase.capitalize %>** <% else %> <img height="30px" src="static-content/<%= severity.to_s.downcase %>.png"/> <% end %> | <% if standalone %> **<%= state.downcase.capitalize %>** <% else %> <img height="30px" src="static-content/<%= state.to_s.downcase %>.png"/> <% end %>  <% if !standalone %>| [ <%=url_title%>](<%=url%>)<% end %>| <%=remediation_update%> |
