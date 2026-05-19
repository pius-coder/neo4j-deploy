FROM neo4j:5

# Installation automatique du plugin APOC (Indispensable pour Graphiti/Agent)
ENV NEO4J_PLUGINS='["apoc"]'
ENV NEO4J_dbms_security_procedures_unrestricted='apoc.*'

# Écoute publique pour Traefik
ENV NEO4J_server_default__listen__address='0.0.0.0'

EXPOSE 7474 7687

# Healthcheck utilisant la variable NEO4J_AUTH
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=5 \
  CMD cypher-shell -u neo4j -p "${NEO4J_AUTH#neo4j/}" "RETURN 1" || exit 1
