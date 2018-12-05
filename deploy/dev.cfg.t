{
  "name": "{{deployConfig.instanceName}}",
  "dependencies": [{% for serv in dependedServers %}
  {
     "project_name": "{{serv.name}}",
     "config_name": "dev"
  }{% if not loop.last %},{% endif %}
  {% endfor %}
  ],
  "roles_seq": ["main"],
  "predefined_variables": {}
}