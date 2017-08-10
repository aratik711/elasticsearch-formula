{%- from "openjdk/map.jinja" import openjdk with context %}

## Set package name by OS
{% set settings = salt['grains.filter_by']({
  'Debian': {
    'package': 'openjdk-8-jdk',
  },
  'RedHat': {
    'package': 'java-1.8.0-openjdk',
  },
}) %}

## Install Openjdk
install_openjdk:
  pkg:
    - installed
    - name: {{ settings.package }}

