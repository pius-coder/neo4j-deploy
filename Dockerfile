FROM neo4j:latest

EXPOSE 7474 7687

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=5 \
  CMD cypher-shell -u neo4j -p "$NEO4J_PASSWORD" "RETURN 1" || exit 1
