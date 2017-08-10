include:
  - elasticsearch.install

## Get ElaticSearch config data from pillar
{%- if salt['pillar.get']('elasticsearch:config') %}
/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elasticsearch/files/elasticsearch.yml
    - user: root
    - template: jinja
    - require:
      - sls: elasticsearch.install
    - context:
        config: {{ salt['pillar.get']('elasticsearch:config', '{}') }}
{%- endif %}

## Retrieve data_dir and log_dir from pillars
{% set data_dir = salt['pillar.get']('elasticsearch:config:path.data') %}
{% set log_dir = salt['pillar.get']('elasticsearch:config:path.logs') %}

## Set permissions for data_dir and log_dir
{% for dir in (data_dir, log_dir) %}
{% if dir %}
{{ dir }}:
  file.directory:
    - user: elasticsearch
    - group: elasticsearch
    - mode: 0700
    - makedirs: True
    - require_in:
      - service: elasticsearch
{% endif %}
{% endfor %}
