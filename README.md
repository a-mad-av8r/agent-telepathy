# agent-telepathy

Event awareness for local AI agent teams.

Memory preserves state. Telepathy tells agents that state changed. This repo is
a runnable public slice of the event-awareness pattern behind Agent Cortex.

The local demo uses SQLite so it can be cloned and run immediately. The same
contract maps cleanly to Redis Streams or another durable event bus in a larger
deployment.

## Quick Start

```bash
git clone https://github.com/a-mad-av8r/agent-telepathy
cd agent-telepathy
cp .env.example .env
./setup.sh
./scripts/telepathy-publish decision.created --summary "Part 2 launch smoke test"
./scripts/telepathy-since saul
./scripts/telepathy-ack saul <event-id>
```

Use `./scripts/telepathy-tail` to inspect the latest events.

## What Is Included

- `schema.sql` with `team_events` and `event_acknowledgements`.
- `scripts/telepathy-publish` to append a project event.
- `scripts/telepathy-since` to show events an agent has not acknowledged.
- `scripts/telepathy-ack` to mark an event seen by an agent.
- `scripts/telepathy-tail` and `scripts/telepathy-diagnose` for operations.
- Event examples and docs for event types and Redis Streams mapping.

## What Is Deliberately Out

- The full handoff lifecycle.
- Role-based permissions.
- Retention workers.
- Platform event routing, customer tenancy, and internal governance controls.

## Series Map

| Part | Repo | Focus |
| --- | --- | --- |
| 1 | [agent-cortex](https://github.com/a-mad-av8r/agent-cortex) | Operating memory core |
| 2 | [agent-telepathy](https://github.com/a-mad-av8r/agent-telepathy) | Event awareness |
| 3 | [agent-handoffs](https://github.com/a-mad-av8r/agent-handoffs) | Structured transfer |
| 4 | [agent-roles](https://github.com/a-mad-av8r/agent-roles) | Role boundaries |
| 5 | [agent-retention](https://github.com/a-mad-av8r/agent-retention) | Memory lifecycle |
| 6 | [agent-multimodel](https://github.com/a-mad-av8r/agent-multimodel) | Shared protocol across tools |

## Author

Amad Malik - Founder and CEO/CTO of Adaptech AI Ltd, building EnGenAI
([engenai.app](https://engenai.app)).

[LinkedIn](https://www.linkedin.com/in/amadmalik/) | [GitHub](https://github.com/a-mad-av8r)
