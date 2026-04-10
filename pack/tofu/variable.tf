#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

variable "apstra_edge_ip" {
  type        = string
  description = "IP address of the Apstra Edge to which syslog messages will be sent."
}

variable "apstra_edge_port" {
  type        = number
  default     = 10514
  description = "UDP port on which the Apstra Edge is listening for syslog messages."
}

variable "blueprint_id" {
  type        = string
  description = "ID of the Apstra blueprint where the configlet will be created."
}

variable "configlet_scope" {
  type        = string
  default     = "role in [\"access\", \"leaf\", \"spine\", \"superspine\"]"
  description = "Selects devices where the configlet should be applied."
}

variable "name" {
  type        = string
  default     = "dca-syslog-streaming"
  description = "Name of the configlet as it will appear in the Apstra blueprint."
}

variable "routing_instance" {
  type        = string
  default     = ""
  description = "Routing instance for syslog traffic. If empty, the routing-instance line is omitted from the configlet."
}
