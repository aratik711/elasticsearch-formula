include:
  - elasticsearch.pkg

{%- if salt['pillar.get']('elasticsearch:config') %}
/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elasticsearch/files/elasticsearch.yml
    - user: root
    - template: jinja
    - require:
      - sls: elasticsearch.pkg
    - context:
        config: {{ salt['pillar.get']('elasticsearch:config', '{}') }}
{%- endif %}

{% set data_dir = salt['pillar.get']('elasticsearch:config:path.data') %}
{% set log_dir = salt['pillar.get']('elasticsearch:config:path.logs') %}

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
