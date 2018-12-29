
| Contract File Name  | SHA1 hash |
| ------------- | ------------- |
<% contract_list.each do |contract| %>
| <%= contract[:filename] %> | <%= contract[:filehash] %> | 
<% end %>