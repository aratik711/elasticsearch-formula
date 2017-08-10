## Error if no firewall package set
firewall_error:
   test.fail_without_changes:
     - name: "Please set firewall package as iptables or firewalld"
     - failhard: True
