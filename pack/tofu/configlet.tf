#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

locals {
  syslog_config_template = <<-EOT
    system {
        syslog {
            host $${apstra_edge_ip} {
                any error;
                interactive-commands warning;
                port $${apstra_edge_port};
                log-prefix "{{ management_ip }}";
                source-address {{ management_ip }};%{~if var.routing_instance != ""}
                routing-instance ${var.routing_instance};%{~endif}
                explicit-priority;
            }
        }
    }
  EOT
}

resource "apstra_datacenter_configlet" "dca_syslog_streaming" {
  name         = "dca-syslog-streaming"
  blueprint_id = var.blueprint_id
  condition    = var.configlet_scope
  generators = [
    {
      config_style = "junos"
      section      = "top_level_hierarchical"
      template_text = templatestring(local.syslog_config_template, {
        apstra_edge_ip   = var.apstra_edge_ip
        apstra_edge_port = var.apstra_edge_port
      })
    },
  ]
}
