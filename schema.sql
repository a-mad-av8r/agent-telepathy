PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS team_events (
  id TEXT PRIMARY KEY,
  project TEXT NOT NULL,
  event_type TEXT NOT NULL,
  actor TEXT NOT NULL,
  summary TEXT NOT NULL,
  payload_json TEXT NOT NULL DEFAULT '{}',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS event_acknowledgements (
  agent_name TEXT NOT NULL,
  event_id TEXT NOT NULL,
  acknowledged_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(agent_name, event_id),
  FOREIGN KEY(event_id) REFERENCES team_events(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_team_events_project_created
ON team_events(project, created_at);
