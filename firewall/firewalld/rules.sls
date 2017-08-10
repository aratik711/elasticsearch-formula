include: 
  - firewall.firewalld.service

# Add 22, 9200, 9300
elasticsearch_firewalld_rules:
  firewalld.present:
    - name: public
    - ports:
      - 22/tcp
      - 9200/tcp
      - 9300/tcp
    - onlyif:
      - rpm -q firewalld
    - require:
      - service: firewalld
