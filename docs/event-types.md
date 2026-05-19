# Event Types

Useful event names are boring and explicit:

- `decision.created`
- `lesson.created`
- `handoff.created`
- `handoff.claimed`
- `handoff.completed`
- `repo.updated`
- `publish.scheduled`
- `publish.completed`

Keep event payloads small. Durable detail belongs in memory or handoff records.
The stream should tell agents that something changed and where to look next.
