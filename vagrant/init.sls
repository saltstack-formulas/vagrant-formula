{% from "vagrant/map.jinja" import vagrant with context %}

vagrant:
  pkg.installed:
    - sources:
      - vagrant: {{ vagrant.url }}

{% for plugin in vagrant.get('plugins', []) %}
vagrant-plugin-{{ plugin }}:
  cmd.run:
    - name: "vagrant plugin install '{{ plugin }}'"
    - unless: "vagrant plugin list | grep '{{ plugin }}'"
{% endfor %}
