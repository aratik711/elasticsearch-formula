include:
  - elasticsearch.pkg
  - elasticsearch.config

elasticsearch_service:
  service.running:
    - name: elasticsearch
    - enable: True
{%- if salt['pillar.get']('elasticsearch:config') %}
    - watch:
      - file: elasticsearch_cfg
      - file: /etc/elasticsearch/jvm.options
      - file: /usr/lib/systemd/system/elasticsearch.service
{%- endif %}
    - require:
      - pkg: elasticsearch
