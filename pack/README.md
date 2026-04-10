# DCA Syslog Streaming

## What Does This Config Pack Do

This config pack creates a configlet that configures Junos devices to stream syslog messages to a specified Apstra Edge. Apstra Edge forwards these messages to DCA for enhanced root cause analysis and anomaly correlation.

## Junos Compatibility

Junos 18.4R1 or later when specifying a `routing_instance`; otherwise Junos 11.3 or later.

> [!NOTE]
> This pack has received limited testing.

## Variables

| Name | Description | Required | Default |
| ---- | ----------- | -------- | ------- |
| `apstra_edge_ip` | IP address of the Apstra Edge to which syslogs will be streamed. | Yes | N/A |
| `apstra_edge_port` | Port on the Apstra Edge to which syslogs will be streamed. | No | `10514` |
| `blueprint_id` | ID of the Apstra blueprint where the configlet will be created. | Yes | N/A |
| `configlet_scope` | Selects devices where the configlet should be applied. | No | `role in ["access", "leaf", "spine", "superspine"]` |
| `name` | Name of the configlet as it will appear in the Apstra blueprint. | No | `dca-syslog-streaming` |
| `routing_instance` | Routing instance for syslog traffic. If empty, the routing-instance line is omitted from the configlet. | No | empty string (`""`) |
