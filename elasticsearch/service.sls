include:
  - elasticsearch.install
  - elasticsearch.config

## Enable and auto restart elasticsearch service after file changes.
elasticsearch_service:
  service.running:
    - name: elasticsearch
    - enable: True
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
      - file: /etc/elasticsearch/jvm.options
      - file: /usr/lib/systemd/system/elasticsearch.service
    - require:
      - pkg: elasticsearch
    - failhard: True
