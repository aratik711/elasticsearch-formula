include:
  - elasticsearch.repo

{% from "elasticsearch/map.jinja" import elasticsearch_map with context %}
{% from "elasticsearch/settings.sls" import elasticsearch with context %}

## Install ElasticSearch pkg with desired version
elasticsearch_pkg:
  pkg.installed:
    - name: {{ elasticsearch_map.pkg }}
    {% if elasticsearch.version %}
    - version: {{ elasticsearch.version[0] }}.{{ elasticsearch.version[1] }}*
    {% endif %}
    - require:
      - sls: elasticsearch.repo
    - failhard: True
