---
marp: true
style: |

  section h1 {
    color: #6042BC;
  }

  section code {
    background-color: #e0e0ff;
  }

  footer {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100px;
  }

  footer img {
    position: absolute;
    width: 120px;
    right: 20px;
    top: 0;

  }
  section #title-slide-logo {
    margin-left: -60px;
  }
---

# Title of the talk
Dhony Silva
@dhony.bsky.social (BlueSky)
github.com/dhonysilva
![h:200](/images/full-color.png#title-slide-logo)

---

# Agenda
- Elixir and OTP
- Demo time!
- Future thoughts

---

# Elixir
- Functional language for the BEAM VM (Erlang)
- All datastructures are immutable
- Dynamically typed
  - gradual type system in-progress
- Friendly, Ruby inspired syntax
- Created by Jose Valim

---

# What's so great about the BEAM?
- Very mature
  - Started by Ericsson in the 80s
- OTP = Open Telecom Platform
- Designed for telecommunications
  - highly concurrent
  - highly available

---

# Processes on the BEAM

- Extremely lightweight (< 2KB per process)
- Isolated memory (no shared state)
- Only communicate via message passing
- Can create millions of processes on a single machine
- **Concurrency without locks!**

---

# Supervising Processes

- Processes are organized in hierarchical **supervision trees**
- **Supervisors** monitor **workers** (and other supervisors)
- When a worker crashes, the supervisor can:
  - Restart it
  - Restart all its children
  - Escalate to its own supervisor
  - Shut everything down
- **Let It Crash**

---

# Example of slide with code
```elixir
defmodule Wasmio2025.Stack do
  use GenServer

  ...

  @impl true
  def init(_) do
    {:ok, []}
  end

  @impl true
  def handle_call(:pop, _from, stack) do
    [head | tail] = state
    {:reply, to_caller, tail}
  end

  def handle_cast({:push, element}, stack) do
    new_state = [element | stack]
    {:noreply, new_state}
  end

end
```

---

# Future topics
- Implement resources
- better config for capabilities
- Get people using it!
- **Extending SAAS platforms with wasm components**
- Polyglot LiveView (or similar)

---

# Thank You!

![h:400](/images/qr-code.png)

Questions?

---
