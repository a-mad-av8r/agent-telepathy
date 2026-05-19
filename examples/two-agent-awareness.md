# Two-Agent Awareness

One agent publishes an event:

```bash
TELEPATHY_ACTOR=saul ./scripts/telepathy-publish decision.created --summary "Use static visuals for the launch post"
```

Another agent starts later and asks what it has not seen:

```bash
./scripts/telepathy-since marlow
./scripts/telepathy-ack marlow evt_...
```

No direct chat is required. The project event stream carries awareness.
