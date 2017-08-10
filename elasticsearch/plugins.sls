include:
  - elasticsearch.install

{% from "elasticsearch/settings.sls" import elasticsearch with context %}
{%- set plugins_pillar = salt['pillar.get']('elasticsearch:plugins', {}) %}

## Set plugin_bin based on ElasticSearch version
{% if elasticsearch.major_version == 5 %}
  {%- set plugin_bin = 'elasticsearch-plugin' %}
{% else %}
  {%- set plugin_bin = 'plugin' %}
{% endif %}

## Install the plugins mentioned in pillar
{% for name, repo in plugins_pillar.items() %}
elasticsearch-{{ name }}:
  cmd.run:
    - name: /usr/share/elasticsearch/bin/{{ plugin_bin }} install -b {{ repo }}
    - require:
      - sls: elasticsearch.install
    - unless: test -x /usr/share/elasticsearch/plugins/{{ name }}
{% endfor %}
