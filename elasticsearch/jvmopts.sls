include:
  - elasticsearch.service


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

/etc/security/limits.conf:
  file.append:
    - text: 
      - "elasticsearch soft memlock unlimited"
      - "elasticsearch hard memlock unlimited"

/usr/lib/systemd/system/elasticsearch.service:
  file.replace:
    - name: /usr/lib/systemd/system/elasticsearch.service
    - pattern: '#LimitMEMLOCK=infinity'
    - repl: 'LimitMEMLOCK=infinity'

elasticsearch_daemon_reload:
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: /usr/lib/systemd/system/elasticsearch.service
