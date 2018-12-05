---
- name: init deploy folder
  file:
    path: "{{'{{'}} deploy_root {{'}}'}}"
    state: directory

- name: copy files to deploy folder
  synchronize:
    src: "./src/"
    dest: "{{'{{'}}deploy_root{{'}}'}}"
    
- name: "configure {{ deployConfig.instanceName }}"
  template:
    src: default.json.template
    dest: "{{'{{'}}deploy_root{{'}}'}}/config/default.json"


- name: "deploy {{ '{{' }} {{ deployConfig.instanceName }} {{ '}}' }} for debug"
  docker_container:
    name: "{{'{{'}} {{ name }} {{'}}'}}"
    image: "node:6.10.3"
    working_dir: "/var/app"
    volumes:
      - "{{'{{'}}deploy_root{{'}}'}}:/var/app:Z"
    ports:
      - "{{'{{'}} {{ deployConfig.instanceName }}_port {{'}}'}}:{{'{{'}} {{ deployConfig.instanceName }}_port {{'}}'}}"
{% if dep_services is not none %} 
    links:
{% for service in dependedServers %}      - "{{'{{'}}{{service.name}}{{'}}'}}:{{'{{'}}{{service.name}}{{'}}'}}"
{% endfor %}      
{% endif %}      
    restart: yes
    recreate: yes
    state: started
    entrypoint: "node app.js"
  when: {{ deployConfig.instanceName }}_debug=="true"

- Name: "deploy {{'{{'}} {{ deployConfig.instanceName }} {{'}}'}} for integration"
  docker_container:
    name: "{{'{{'}} {{ deployConfig.instanceName }} {{'}}'}}"
    image: "node:6.10.3"
    working_dir: "/var/app"
    volumes:
      - "{{'{{'}}deploy_root{{'}}'}}:/var/app:Z"
    exposed: "{{'{{'}} {{ deployConfig.instanceName }}_port{{'}}'}}"
{% if dep_services is not none %} 
    links:
{% for service in dependedServers %}      - "{{'{{'}}{{service.name}}{{'}}'}}:{{'{{'}}{{service.name}}{{'}}'}}"
{% endfor %}      
{% endif %}      
    restart: yes
    recreate: yes
    state: started
    entrypoint: "node app.js"
  when: {{ deployConfig.instanceName }}_debug=="false"



...
