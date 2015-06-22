# See https://github.com/voltrb/volt#routes for more info on routes

client '/admin/{{year}}/edit',  component: 'admin', controller: 'main', action: 'edit'
client '/admin/{{year}}',       component: 'admin', controller: 'main', action: 'index'
client '/admin/',               component: 'admin', controller: 'main', action: 'index'

client '/admin',                component: 'admin', controller: 'admin', action: 'index'
