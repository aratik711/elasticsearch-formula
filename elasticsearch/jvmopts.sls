include:
  - elasticsearch.service

## Copy the jvm.options file from template
/etc/elasticsearch/jvm.options:
  file.managed:
    - source: salt://elasticsearch/files/jvm.options
    - user: root
    - group: elasticsearch
    - mode: 0660
    - template: jinja
    - watch_in:
      - service: elasticsearch_service
    - context:
        jvm_opts: {{ salt['pillar.get']('elasticsearch:jvm_opts', '{}') }}

## Set ulimit for elasticsearch user
/etc/security/limits.conf:
  file.append:
    - text: 
      - "elasticsearch soft memlock unlimited"
      - "elasticsearch hard memlock unlimited"

## Set MEMLOCK for elasticsearch
/usr/lib/systemd/system/elasticsearch.service:
  file.replace:
    - name: /usr/lib/systemd/system/elasticsearch.service
    - pattern: '#LimitMEMLOCK=infinity'
    - repl: 'LimitMEMLOCK=infinity'

## Reload Elasticsearch daemon after change in elasticsearch.service file
elasticsearch_daemon_reload:
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /usr/lib/systemd/system/elasticsearch.service
