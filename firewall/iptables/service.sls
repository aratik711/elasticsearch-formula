include:
  - firewall.iptables.install

## Start and enable iptables service
iptables:
  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: iptables_install

