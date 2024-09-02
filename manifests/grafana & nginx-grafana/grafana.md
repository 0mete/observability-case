[server]
domain = capar.dev
root_url = %(protocol)s://%(domain)s/grafana/
serve_from_sub_path = true
[auth.anonymous]
enabled = true
org_name = Main Org.
org_role = Viewer
hide_version = true
You should add these configs to your grafana ini file