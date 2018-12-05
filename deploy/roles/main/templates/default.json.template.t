{
    "port": {{'{{'}}{{ deployConfig.instanceName }}_port{{'}}'}} {% if dependedServers %},
{% for service in dependedServers %}    "{{service.name}}": "{{'{{'}}{{service.name}}{{'}}'}}",
    "{{service.name}}_port": "{{'{{'}}{{service.name}}_port{{'}}'}}"{%if not loop.last %},{% endif %}
{% endfor %}{% endif %}
}