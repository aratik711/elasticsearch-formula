include:
  - firewall.iptables.service

## Open port 9200
iptables_elasticsearch_rest_api:
  iptables.insert:
    - position: 5
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
      - state
      - tcp
      - comment
    - comment: "Allow ElasticSearch REST API port"
    - connstate: NEW
    - dport: 9200
    - proto: tcp
    - save: True
    - require: 
      - service: iptables
    - onlyif:
      - rpm -q iptables-services

## Open port 9300
iptables_elasticsearch_node_comm:
  iptables.insert:
    - position: 6
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
      - state
      - tcp
      - comment
    - comment: "Allow ElasticSearch Node communication port"
    - connstate: NEW
    - dport: 9300
    - proto: tcp
    - save: True
    - require:
      - service: iptables
    - onlyif:
      - rpm -q iptables-services


