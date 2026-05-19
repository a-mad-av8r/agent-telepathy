# Redis Streams Mapping

This public repo uses SQLite to keep the demo dependency-light.

In production, the same contract can map to Redis Streams:

- `team_events` -> stream key such as `project:local:events`
- `id` -> Redis stream entry ID
- `event_type`, `actor`, `summary`, `payload_json` -> stream fields
- `event_acknowledgements` -> consumer group offsets

The important property is durable awareness. An agent that starts later must be
able to ask what changed while it was away.
